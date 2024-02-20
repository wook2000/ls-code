=begin
**P
- input: string value of DNA nucleic acid sequence
- output: integer value of Hamming distance
- rules:
  - only sequences of equal length of compared
  - if unequal length, use the shorter length for comparison

**E
- 

**H
- string value of strand provided to instantiate new DNA object
- string value of 2nd strand provided for comparison
- #hamming_distance is the primary method

**D
- @strand
- @distance

=end


class DNA
  def initialize(strand)
    @strand = strand  
  end

  def hamming_distance(distance)
    eval_length = [@strand.size, distance.size].min
    count = 0
    eval_length.times do |idx|
      count += 1 if @strand[idx] != distance[idx]
    end
    count
  end
end