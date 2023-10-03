# Introduction to Programming with Ruby
# Chapter 8 - More Stuff
# Exercise 2

# code given:
def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

=begin
The above code will not print to screen because the block has not been
activated with the .call method 
=end
