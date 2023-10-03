# Introduction to Programming with Ruby
# Chapter 7 - Hashes
# Exercise 3

hash1 = {one: 1, two: 2, three: 3}

hash1.each_key { |k| puts "Key for hash: #{k}" }
hash1.each_value { |v| puts "Value within hash: #{v}" }
hash1.each { |k, v| puts "Entry within hash: #{k} => #{v}" }