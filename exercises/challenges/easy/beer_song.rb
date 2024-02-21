=begin
  3 bottles of beer on the wall, 3 bottles of beer.
  Take one down and pass it around, 2 bottles of beer on the wall.

  2 bottles of beer on the wall, 2 bottles of beer.
  Take one down and pass it around, 1 bottle of beer on the wall.

  1 bottle of beer on the wall, 1 bottle of beer.
  Take it down and pass it around, no more bottles of beer on the wall.

  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall.
=end

class BeerSong
  def self.verse(num)
    "#{line1(num)}\n#{line2a(num)}#{line2b(num)}\n"
  end

  def self.verses(start, stop)
    lyrics = []
    start.downto(stop) do |num|
      lyrics << verse(num)
    end
    lyrics.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def line1(verse)
      bottle_lyric = bottle_to_s(verse)
      "#{bottle_lyric.capitalize} of beer on the wall, #{bottle_lyric} of beer."
    end

    def line2a(verse)
      case verse
      when 0 then 'Go to the store and buy some more, '
      when 1 then 'Take it down and pass it around, '
      else
        'Take one down and pass it around, '
      end
    end

    def line2b(verse)
      bottle_lyric = verse == 0 ? bottle_to_s(99) : bottle_to_s(verse - 1)
      "#{bottle_lyric} of beer on the wall."
    end

    def bottle_to_s(verse)
      case verse
      when 0 then 'no more bottles'
      when 1 then '1 bottle'
      else
        "#{verse} bottles"
      end
    end
  end
end
