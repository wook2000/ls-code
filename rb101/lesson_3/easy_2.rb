advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match?("dino")
p advice.include?("dino")

new_var = advice.slice!(0, advice.index('house'))

p new_var
p advice

a = "hello world"
p a.count("lo")

string = 'hello'
new_string = string[0]
p string
p new_string
p string.object_id
p new_string.object_id
string[0].upcase!
p string
p new_string

arr = %w(a b c)
new_arr = arr[0]
p arr
p new_arr
p arr.object_id
p new_arr.object_id
arr[0].upcase!
p arr
p new_arr