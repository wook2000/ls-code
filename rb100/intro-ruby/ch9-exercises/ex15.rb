# Introduction to Programming with Ruby
# Chapter 9 - Exercises
# Exercise 15

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

=begin
Hash pairs are not indexed, and so the order in which they are entered is
not too important.  hash1 and hash2 do have the same pairs, and so the
if/else will return "These hashes are the same!"
=end