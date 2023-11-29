# Introduction to Programming with Ruby
# Chapter 1 - The Basics
# Exercise 3

movies = { :hook => 1991,
           :et => 1982,
           :aladdin => 1992,
           :goonies => 1985}

movies.each { |m, d| puts d }