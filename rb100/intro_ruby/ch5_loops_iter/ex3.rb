# Introduction to Programming with Ruby
# Chapter 5 - Loops & Iterators
# Exercise 3

def count_down(num)
  if num != 0
    puts num
    count_down( num - 1 )
  else
    puts "Blast off!"
  end
end

print "Time to blast off?: "
time = gets.chomp.to_i
count_down(time)

