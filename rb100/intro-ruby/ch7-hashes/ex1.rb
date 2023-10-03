# Introduction to Programming with Ruby
# Chapter 7 - Hashes
# Exercise 1

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

siblings = family.select { |k, v| k == :sisters || k == :brothers }

sib_names = siblings.values.flatten

p sib_names