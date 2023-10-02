# Introduction to Programming with Ruby
# Chapter 3 - Methods
# Exercise 5

def scream(words)
  words = words + "!!!!"
  puts words
end

a = scream("Yippeee")
p a

=begin
By deleting the 'return', the code my prints "Yippeee" onto the screen. 
However, scream("Yippeee") still returns nil as the 'puts' method returns
a nil.
=end