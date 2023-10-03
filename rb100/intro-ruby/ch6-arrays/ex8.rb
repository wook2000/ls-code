# Introduction to Programming with Ruby
# Chapter 6 - Arrays
# Exercise 8

orig_array = [0, 10, 20, 30]

new_array = orig_array.map { |x| x + 2 }

p "The original array is #{orig_array}"
p "The new array is #{new_array}"