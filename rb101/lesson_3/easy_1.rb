=begin

numbers = [1, 2, 2, 3]
new_var = numbers.uniq

p numbers
p new_var


advice = "Few things in life are as important as house training your pet dinosaur."
p advice

new_var = advice.gsub("important", "urgent")
p new_var

p advice

=end

numbers = [1, 2, 3, 4, 5]
p numbers

new_var1 = numbers.delete_at(1)
p numbers

new_var2 = numbers.delete(1)

p numbers
p new_var1
p new_var2
