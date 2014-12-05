#Listing 14.2: Chat server using TCPServer and threads
require 'socket'

def welcome(chatter)
  chatter.print "Welcome! Please enter your name: "
  chatter.readline.chomp #readline is synonym for gets; readline raises EOFError objects
end

def broadcast(message, chatters)
  chatters.each do |chatter|
    chatter.puts message
  end
end

s = TCPServer.new(3500)

chatters = []

while (chatter = s.accept)
  Thread.new(chatter) do |c|
    name = welcome(chatter)
    broadcast("#{name} has joined", chatters)
    chatters << chatter
    begin
      loop do
        line = c.readline #if the client leaves the server, EOFError gets raised next loop
        broadcast("#{name}: #{line}", chatters)
      end
    rescue EOFError
      c.close
      chatters.delete(c)
      broadcast("#{name} has left", chatters)
    end
  end
end