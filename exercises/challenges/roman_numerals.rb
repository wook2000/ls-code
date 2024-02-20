=begin
**P
- input: integer value
- output: string value representing the roman number equivalent to the input integer
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
- move up from single to ten to hundred to thousand, looking at the 5 midway point

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
      one = ROMAN_NUMBERS[0 + idx * 2]
      five = ROMAN_NUMBERS[1 + idx * 2]
      ten = ROMAN_NUMBERS[2 + idx * 2]
      count_five, singles = digit.divmod(5)
      roman_digit = ''
      if singles == 4
        if count_five == 1
          roman_digit = one + ten
        else
          roman_digit = one + five
        end
      else
        roman_digit << five if count_five == 1
        roman_digit << one * singles
      end
      result.prepend(roman_digit)
    end
    result
  end
end
