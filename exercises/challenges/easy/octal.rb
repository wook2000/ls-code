=begin
**P
- input: string representation of octal number
- output: integer representation of decimal equivalent
- rules:
  - invalid input forced to zero

**E

**H

**D

=end

class Octal
  def initialize(octal)
    @number = octal.match(/[^0-7]/) ? [0] : octal.to_i.digits
  end

  def to_decimal
    @number.map.with_index do |num, idx|
      num * (8**idx)
    end.sum
  end
end
