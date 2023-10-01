# Introduction to Programming with Ruby
# Chapter 1 - The Basics
# Exercise 2

num = 4837

thou = num / 1000
hund = num % 1000 / 100
tens = num % 1000 % 100 / 10
ones = num % 1000 % 100 % 10

puts "The 4-digit number in question is #{num}."
puts "The digit in the thousands place is #{thou}."
puts "The digit in the hundreds place is #{hund}."
puts "The digit in the tens place is #{tens}."
puts "The digit in the ones place is #{ones}."