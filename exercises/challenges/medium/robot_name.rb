=begin

=end

# class Robot
#   attr_reader :name

#   @@names = []

#   def initialize
#     reset
#   end

#   def reset
#     @name = generate_name
#     @@names << @name
#   end

#   private

#   def generate_name
#     name = ''
#     loop do
#       char_range = ('A'.ord..'Z'.ord)
#       name = rand(char_range).chr + rand(char_range).chr +
#             rand(9).to_s + rand(9).to_s + rand(9).to_s
#       break unless @@names.include? name
#     end
#     name
#   end
# end

class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    char_range = (('A'.ord)..('Z'.ord))
    rand(char_range).chr + rand(char_range).chr +
      rand(9).to_s + rand(9).to_s + rand(9).to_s
  end
end
