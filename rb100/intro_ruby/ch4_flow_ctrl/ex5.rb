# Introduction to Programming with Ruby
# Chapter 4 - Flow Control
# Exercise 5

# Code in question:
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

equal_to_four(5)

=begin
Generates an error message similar to that below:

exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end

Two code blocks were initiated, one to define the method and one for the
if/else conditional.  As such, there should be two 'end' keywords but 
there is only one in the code to close off the if/else loop.  The fix is
to close off the method with an 'end'.
=end
 