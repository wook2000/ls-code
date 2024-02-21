=begin

=end

class Series
  def initialize(str)
    @str = str.reverse.to_i.digits
  end

  def slices(num)
    raise ArgumentError unless num <= @str.size
    series = []
    0.upto(@str.size - num) do |start_idx|
      series << @str[start_idx, num]
    end
    series
  end
end
