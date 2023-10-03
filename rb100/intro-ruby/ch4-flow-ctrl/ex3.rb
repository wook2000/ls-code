# Introduction to Programming with Ruby
# Chapter 4 - Flow Control
# Exercise 3

def compare_50_100(num)
  
  if num < 0
    response = "Your number #{num} is a negative number."
  elsif num <= 50  
    response = "Your number #{num} is between 0 and 50."
  elsif num <= 100
    response = "Your number #{num} is between 51 and 100."
  else
    response = "Your number #{num} is greater than 100."
  end

  puts response
  response
end

print "Please enter a number between 0 and 100: "
user_input = gets.chomp.to_i
compare_50_100(user_input)