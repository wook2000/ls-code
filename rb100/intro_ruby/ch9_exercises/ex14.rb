# Introduction to Programming with Ruby
# Chapter 9 - Exercises
# Exercise 14

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |str| str.split }
a.flatten!
p a