# Introduction to Programming with Ruby
# Chapter 2 - Variables
# Exercise 5

# Program 1
x = 0
3.times do
  x += 1
end
puts x

# Program 2
y = 0
3.times do
  y += 1
  x = y
end
puts x

=begin
  Program 1 prints 3 to the screen - x was initialized outside the block
  and since inner scope can access variables initialized in an outer scope,
  the variable 'x' is modified through the program.

  Program 2 generates an error as x was initialized within the block and
  thus is not available outside of the block whwere it was initializaed.
end
