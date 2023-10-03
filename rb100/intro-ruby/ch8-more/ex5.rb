# Introduction to Programming with Ruby
# Chapter 8 - More Stuff
# Exercise 5

# code given:
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

=begin
Error generated:
block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'

When defining a block, '&' must be used in the definition to indicate that
this is a block.  Without the '&', a standard method with an argument has
been defined, and when called, the method will be looking for an argument, 
not an executable

=end