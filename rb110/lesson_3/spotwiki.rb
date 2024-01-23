# Each, Map, Select

# What does the following code return? What does it output? Why?
# What concept does it demonstrate?

# Example 1
array = [1, 2, 3, 4, 5]
array.select do |num|
  puts num if num.odd?
end

# Example 2
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }

# Example 3
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
  n + 1
end

p new_array

# Example 4
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
  n + 1
  puts n
end

p new_array

# Example 5
words = %w(jump trip laugh run talk)
new_array = words.map do |word|
  word.start_with?("t")
end

p new_array

# Example 6
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |n| puts n }

# Example 7
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented = arr.map do |n|
  n + 1
end

p incremented

# Example 8
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1
end

p new_array

# Example 9
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array

# Example 10
a = "hello"
[1, 2, 3].map { |num| a }

# Example 11
[1, 2, 3].each do |num|
  puts num
end

# Other Collection Methods

# Example 1
[1, 2, 3].any? do |num|
  num > 2
end

# Example 2
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

# Example 3
[1, 2, 3].all? do |num|
  num > 2
end

# Example 4
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end

# Example 5
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# Example 6
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end

# Example 7
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end

# Example 8
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
