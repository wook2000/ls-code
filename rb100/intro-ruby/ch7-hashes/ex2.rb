# Introduction to Programming with Ruby
# Chapter 7 - Hashes
# Exercise 2

hash1 = {one: 1, two: 2, three: 3}
hash2 = {four: 4}

hash3 = hash1.merge(hash2)

p "The original hash is #{hash1}"
p "The additional hash is #{hash2}"
p "The .merge without an '!' creates: #{hash3}"
p "And maintains the original hash as: #{hash1}"

hash1.merge!(hash2)
p "But when bashed, the original hash transforms into #{hash1}"
