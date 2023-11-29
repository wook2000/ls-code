# Introduction to Programming with Ruby
# Chapter 9 - Exercises
# Exercise 16

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]

contacts = {"Joe Smith" => {}}

# Need to introduce field names
field_name = [:email, :address, :phone]

contacts.each do |name, data|
  field_name.each do |field|
    data[field] = contact_data.shift
  end
end

p contacts


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Need to introduce field names
field_name = [:email, :address, :phone]

contacts.each_with_index do |(name, data), idx|
  field_name.each do |field|
    data[field] = contact_data[idx].shift
  end
end

p contacts