# Introduction to Programming with Ruby
# Chapter 8 - More Stuff
# Exercise 1

def has_lab?(string)
  if /lab/.match(string)
    puts string
  else
    puts "No match"
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")