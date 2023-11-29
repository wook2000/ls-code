# Introduction to Programming with Ruby
# Chapter 6 - Arrays
# Exercise 6

# code provided:
names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'

=begin
error generated:
TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

Judging from the code, it seems the original intent is to replace 'margaret'
with 'jody'
To do so, the code is trying to access 'margaret', except array[index] 
wants the index argument to be an integer
The following should fix things:
=end

names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'