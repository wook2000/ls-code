# Introduction to Programming with Ruby
# Chapter 5 - Loops & Iterators
# Exercise 2

user_input = ""

while user_input != "STOP" do
  print "Let's play a game! Give me a number and I will double it: "
  num = gets.chomp.to_i
  puts "Double of #{num} is #{ num * 2 }!"
  puts "Type 'STOP' to exit or anything else to play again: "
  user_input = gets.chomp
end
