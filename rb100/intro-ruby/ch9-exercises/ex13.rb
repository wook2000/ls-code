# Introduction to Programming with Ruby
# Chapter 9 - Exercises
# Exercise 13

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr.delete_if { |x| x.start_with?("s") }

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p arr.delete_if { |x| x.start_with?("s") || x.start_with?("w") }