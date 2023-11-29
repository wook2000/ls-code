# Introduction to Programming with Ruby
# Chapter 6 - Arrays
# Exercise 2

1. arr = ["b", "a"]
    # Returns ["b", "a"]
   arr = arr.product(Array(1..3))
    # Returns [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
   arr.first.delete(arr.first.last)
=begin
Returns 1 - The .delete method will return the value that is being deleted
The value being deleted is arr.first.last, which is the last value of the
first array, which is 1
=end

2. arr = ["b", "a"]
    # Returns ["b", "a"]
   arr = arr.product([Array(1..3)])
    # Returns [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
=begin
.product is expecting an array as an argument - by passing in 'Array(1..3)'
within []s, 'Array(1..3)' became an array value within an array with one
single index
=end
   arr.first.delete(arr.first.last)
=begin
Returns [1, 2, 3] - The .delete method will return the value that is being deleted
The value being deleted is arr.first.last, which is the last value of the
first array, which is [1, 2, 3]
=end