=begin
**P

**E

**H

**D

=end

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers == [] ? [3, 5] : numbers
  end

  def self.to(target)
    SumOfMultiples.new.to(target)
  end

  def to(target)
    multiples = []
    @numbers.each do |number|
      multiple = 0
      loop do
        multiple += number
        break if multiple >= target
        multiples << multiple
      end
    end
    multiples.uniq.sum
  end
end
