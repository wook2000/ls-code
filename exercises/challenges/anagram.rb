=begin
**P
- input: string value
- output: array that contains all comparison strings that are anagrams
- rules:
  - return multiple matches
  - case insensitive
  - identical word is not an anagram
  - substrings don't count

**E


**H
- #match is the primary method
- must override #match to apply to string instance variable
- maybe combo of pop and delete?

**D


=end

# first attempt
# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(str_arr)
#     result = []
#     str_arr.each do |str|
#       template = @word.downcase
#       comparison = str.downcase
#       next unless comparison.size == template.size && comparison != template      
#       @word.size.times do
#         comparison.sub!(template[-1], "")
#         template.chop!
#       end
#       result << str if comparison == ""
#     end
#     result
#   end
# end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    arr.select { |str| str.downcase != @word && anagram?(str, @word)}
  end

  private

  def sorted(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted(word1) == sorted(word2)
  end
end