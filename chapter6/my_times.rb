class Integer
  def my_times
    c = 0
    until c == self #self i.e. the calling object i.e. the number 5
      yield(c)
      c += 1
    end
    self
  end
end

5.my_times {|i| puts "I'm on iteration #{i}!"}