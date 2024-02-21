=begin

=end

class Clock
  attr_accessor :hour, :min

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min=0)
    new(hour, min)
  end

  def to_s
    format('%02d:%02d', hour, min)
  end

  def +(min_added)
    time = (hour * 60) + min + min_added
    hour = (time / 60) % 24
    min = time % 60
    self.class.new(hour, min)
  end

  def -(min_subtracted)
    time = (hour * 60) + min - min_subtracted + (60 * 24)
    hour = (time / 60) % 24
    min = time % 60
    self.class.new(hour, min)
  end

  def ==(other)
    hour == other.hour && min == other.min
  end
end
