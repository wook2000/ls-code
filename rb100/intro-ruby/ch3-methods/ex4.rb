# Introduction to Programming with Ruby
# Chapter 3 - Methods
# Exercise 4

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

a = scream("Yippeee")
p a

=begin
The above code doesn't print anything to the screen.  This is because the
explicit return exits the method before hitting the "puts" command.  In
this case, scream("Yippeee") returns nil, as the explicit return doesn't
return anything. 
=end