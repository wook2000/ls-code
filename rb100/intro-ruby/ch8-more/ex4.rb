# Introduction to Programming with Ruby
# Chapter 8 - More Stuff
# Exercise 4

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }