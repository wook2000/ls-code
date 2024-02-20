=begin
**P
- input: string value
- output: integer value, which is the sum total of all letters
- rules:
  - ignore all whitespace
  - ignore nil
  - case insensitive

**E

**H
- 
**D


=end

class Scrabble
  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def initialize(word)
    @word = word.nil? ? "" : word.gsub(/\s+/, "")
  end

  def score
    score = 0
    @word.each_char do |letter|
      POINTS.each do |letters, points|
        score += points if letters.include? letter.upcase
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
