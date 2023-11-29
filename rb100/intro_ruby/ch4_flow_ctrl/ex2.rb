# Introduction to Programming with Ruby
# Chapter 4 - Flow Control
# Exercise 2

def conditional_upper_case(phrase)
  phrase.upcase! if phrase.length > 10
  puts phrase
end

conditional_upper_case("hello")

conditional_upper_case("hello pups")

conditional_upper_case("hello world")