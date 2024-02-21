=begin
**P
- input: integer value
- output: string value representing the roman number equivalent to the
  input integer
- rules:

**E
- 1 => I
- 2 => II
- 4 => IV
- 9 => IX
- 27 => XXVII
- 48 => XLVIII

**H
- instantiate with one integer argument
- #to_roman is the primary method
- move up from single to ten to hundred to thousand, looking at the
  5 midway point

**D

=end

class RomanNumeral
  ROMAN_NUMBERS = %w(I V X L C D M)

  def initialize(num)
    @num = num
  end

  def to_roman
    result = ''
    @num.digits.each_with_index do |digit, idx|
      assign_one_five_ten(idx)
      roman_digit = construct_roman_digit(digit)
      result.prepend(roman_digit)
    end
    result
  end

  private

  def assign_one_five_ten(index)
    @one = ROMAN_NUMBERS[0 + (index * 2)]
    @five = ROMAN_NUMBERS[1 + (index * 2)]
    @ten = ROMAN_NUMBERS[2 + (index * 2)]
  end

  def construct_roman_digit(num)
    if num == 9 then @one + @ten
    elsif num == 4 then @one + @five
    elsif num >= 5 then @five + (@one * (num % 5))
    else
      @one * (num % 5)
    end
  end
end
