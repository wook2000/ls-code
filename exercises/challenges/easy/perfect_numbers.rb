=begin
**P
- input: integer value to method, not to object
- output: string value of 'perfect', 'deficient', or 'abundant'
- rules:
  - perfect: Aliquot sum equal to the original number
  - abundant: Aliquot sum greater than the original number
  - deficient: Aliquot sum less than the original number
  - Aliquot sum: sum of all positive divisors (not including self) of a number
  - negative input or zero raises StandardError
  - #classify is a class method, not an instance method

**E

**H

**D

=end

class PerfectNumber
  def self.classify(num)
    raise StandardError unless num >= 1
    aliquot = (1...num).select { |n| num % n == 0 }.sum
    case aliquot <=> num
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end
end
