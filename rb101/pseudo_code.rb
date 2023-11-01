# EXAMPLE

=begin
Casual Pseudo Code
  Given a collection of integers.

  Iterate through the collection one by one.
    - save the first value as the starting value.
    - for each iteration, compare the saved value with the current value.
    - if the saved value is greater, or it's the same
      - move to the next value in the collection
    - otherwise, if the current value is greater
      - reassign the saved value as the current value

  After iterating through the collection, return the saved value.

Formal Pseudo Code
  START

  # Given a collection of integers called "numbers"

  SET iterator = 1
  SET saved_number = value within numbers collection at space 1

  WHILE iterator <= length of numbers
    SET current_number = value within numbers collection at space "iterator"
    IF saved_number >= current_number
      go to the next iteration
    ELSE
      saved_number = current_number

    iterator = iterator + 1

  PRINT saved_number

  END
=end

# Program Code
def find_greatest(numbers)
  saved_number = numbers[0]

  numbers.each do |num|
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end


# A method that returns the sum of two integers

=begin
Casual Pseudo Code
  - Given two integers.
  - Calculate the sum of the two integers and assign to new variable.
  - Return the calculated value.

Formal Pseudo Code
  START

  # Given two integers called "number1" and "number2"

  SET answer to number1 plus number2

  PRINT answer

  END
=end


# A method that takes an array of strings, and returns a string that is all
# those strings concatenated together

=begin
Casual Pseudo Code
  - Given a collection of strings
  - Iterate through the collection one by one
    - initialize a result variable to 'nil'
    - for each iteration, pconcatenate current string into the result string
  - After iterating through the collection, return the resulting value

Formal Pseudo Code
  START

  # Given a collection of strings called "blurbs"

  SET iterator = 1
  SET result = 'nil'

  WHILE iterator <= length of blurbs
    SET result = current blurb pushed onto the result array
    iterator = iterator + 1

  PRINT result

  END
=end


