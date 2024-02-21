=begin
**P
- input: 3 integer arguments passed in to instantiate triable object
- output: string value of either 'equilateral', 'isosceles', or 'scalene'
- rules:
  - all sides must be of length > 0
  - sum of lengths of any two sides must be greater than the length of
    the third side

**E
- (2, 2, 2) => equilateral
- (10, 10, 10) => equilateral
- (3, 4, 4) => isosceles
- (4, 3, 4) => isosceles
- (4, 4, 3) => isosceles
- (10, 10, 2) => isosceles
- (3, 4, 5) => scalene
- (10, 11, 12) => scalene
- (5, 4, 2) => scalene
- (0.4, 0.6, 0.3) => scalene
- (0, 0, 0) => ArgumentError
- (3, 4, -5) => ArgumentError
- (1, 1, 3) => ArgumentError
- (7, 3, 2) => ArgumentError
- (10, 1, 3) => ArgumentError
- (1, 1, 2) => ArgumentError

**H
- there is a class with name 'Triangle'
- Triangle is initialized with 3 integers
- raise ArgumentError if integer set does not meet rules
  - raise error during instantiation => error check in #initialize
- #kind method is the one primary method within Triangle
  - compare side lengths
    - all same => equilateral
    - only two same => isosceles
    - else => scalene

**D
- sides array

**A

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid?
  end

  def kind
    case @sides.count(@sides.max)
    when 3 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end

  private

  def valid?
    length_valid = @sides.min > 0
    shape_valid = (@sides.sum - (@sides.max * 2)) > 0
    length_valid && shape_valid
  end
end
