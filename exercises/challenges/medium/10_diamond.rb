=begin

=end

class Diamond
  def self.make_diamond(letter)
    target = letter.upcase
    letter_range = ('A'..target).to_a + ('A'...target).to_a.reverse
    create_string(letter_range)
  end

  class << self
    private

    def create_string(range)
      width = range.size
      result = ''
      current_width = 1
      range.each_with_index do |letter, idx|
        line_output = create_line(letter, current_width)
        result << "#{line_output.center(width)}\n"
        current_width = idx < width / 2 ? current_width + 2 : current_width - 2
      end
      result
    end

    def create_line(letter, width)
      line_output = letter
      (width - 1).times { line_output += " " }
      line_output[-1] = letter
      line_output
    end
  end
end
