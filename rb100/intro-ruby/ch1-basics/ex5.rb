# Introduction to Programming with Ruby
# Chapter 1 - The Basics
# Exercise 5

numbers = [5, 6, 7, 8]

numbers.each do |x|
  num = x
  factorial = 1
  until x < 1
    factorial *= x
    x -= 1
  end
  puts "The factorial of #{num} is #{factorial}."
end