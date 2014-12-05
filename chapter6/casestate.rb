#Interpreting user input with a case statement

print "Exit the program? (yes or no): "
answer = gets.chomp
case answer
when "y","yes"
  puts "Good-bye!"
  exit
when "no"
  puts "OK, we'll continue"
else
  puts "That's an unknown answer -- assuming you mean't 'no'"
end
puts "Continuing with program..."