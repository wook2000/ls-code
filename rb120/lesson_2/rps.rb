class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

=begin
Amazing code that Nathan Johnson submitted for code review!

class Move
  include Comparable
  attr_reader :value

  # Format: 'value_A' => [<values that value_A beats>]
  VALUES_BEATEN = { 'rock' => ['scissors', 'lizard'],
                    'paper' => ['rock', 'spock'],
                    'scissors' => ['paper', 'lizard'],
                    'spock' => ['scissors', 'rock'],
                    'lizard' => ['spock', 'paper'] }
  VALUES = VALUES_BEATEN.keys

  def initialize(value)
    @value = value
  end

  def <=>(other)
    if @value == other.value
      0
    elsif VALUES_BEATEN[@value].include?(other.value)
      1
    else
      -1
    end
  end

  def to_s
    @value
  end
end

class Player
  include Comparable
  attr_accessor :name, :score, :opponent
  attr_reader :move, :moves

  def initialize
    reset
  end

  def reset
    @score = 0
    @moves = []
  end

  def <=>(other)
    score <=> other.score
  end

  def move=(m)
    @moves << m
    @move = m
  end
end

class Human < Player
  def initialize
    super
    prompt_name
  end

  def prompt_name
    n = nil
    loop do
      puts "Input player name:"
      n = gets.strip.squeeze(" ")
      break unless n.empty?
      puts "Name cannot be empty."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please pick a move: (#{Move::VALUES.join(', ')})"
      choice = gets.strip.downcase
      break if Move::VALUES.include? choice
      puts "Invalid input."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def self.new_random
    personalities = ['Mosscap', 'ATM', 'Charles Xavier', 'Mirror', 'Computer']

    chosen_name = personalities.sample
    chosen_class = case chosen_name
                   when 'Mosscap' then Mosscap
                   when 'ATM' then ATM
                   when 'Charles Xavier' then CharlesXavier
                   when 'Mirror' then Mirror
                   else Computer
                   end
    chosen_class.new(chosen_name)
  end

  def initialize(name,)
    super()
    self.name = name
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Mosscap is a robot in the delightful novella
# "A Psalm for the Wild-Built" by Becky Chambers
class Mosscap < Computer
  def choose
    self.move = Move.new(
      case rand(3)
      when 1 then 'rock'
      when 2 then 'lizard'
      else Move::VALUES.sample
      end
    )
  end
end

# An ATM dispenses paper, usually...
class ATM < Computer
  def choose
    self.move = Move.new(
      case rand(10)
      when 9 then 'rock'
      else 'paper'
      end
    )
  end
end

# Charles doesn't like to lose.
class CharlesXavier < Computer
  def choose
    losing_moves = Move::VALUES_BEATEN[opponent.move.value]
    safe_moves = Move::VALUES.difference(losing_moves)

    self.move = Move.new(
      case rand(2)
      when 1 then safe_moves.sample
      else Move::VALUES.sample
      end
    )
  end
end

# The Mirror copies you until broken with consecutive rocks
# Once shattered, the shards repeat moves already played
# This persists in a rematch
class Mirror < Computer
  def choose
    self.move = Move.new(
      broken? ? @pre_break_values.sample : opponent.move.value
    )
  end

  def broken?
    return true if @pre_break_values

    return false unless opponent.moves.last(2).map(&:value).all?('rock')

    name.prepend "Shattered "
    @pre_break_values = opponent.moves.map(&:value)
  end
end

class RPSGame
  private

  attr_reader :human, :computer

  WINNING_POINTS = 5
  GAME_NAME = Move::VALUES.map(&:capitalize).join(', ')

  def initialize
    system 'clear'
    @human = Human.new
    @computer = Computer.new_random
    human.opponent = computer
    computer.opponent = human
  end

  def reset
    human.reset
    computer.reset
  end

  def display_welcome_message
    system 'clear'
    puts "Hello #{human.name}."
    puts "Welcome to #{GAME_NAME}!"
    puts "Your opponent today is #{computer.name}."
  end

  def display_goodbye_message
    puts "Thanks for playing #{GAME_NAME}. Goodbye #{human.name}."
  end

  def display_round_result
    system 'clear'
    display_moves

    winner = round_winner
    message = winner.nil? ? "It's a tie!" : "#{winner.name} wins the round."
    puts "=> #{message}\n\n"
  end

  def display_moves
    [human, computer].each do |player|
      puts "#{player.name} plays #{player.move}."
    end
  end

  def display_score
    display_points

    if game_over?
      puts "=> #{game_leader.name} wins the match!\n\n"
      display_history
      puts
    else
      puts "(First to #{WINNING_POINTS} wins)\n\n"
    end
  end

  def display_points
    [human, computer].each do |player|
      puts "#{player.name} has #{player.score} points."
    end
  end

  def display_history
    [human, computer].each do |player|
      puts "#{player.name} played: #{player.moves.join(', ')}"
    end
  end

  def display_rematch
    system 'clear'
    puts "Rematching against #{computer.name}."
  end

  def round_winner
    case human.move <=> computer.move
    when 1 then human
    when -1 then computer
    when 0 then nil
    end
  end

  def game_over?
    game_leader.score >= WINNING_POINTS
  end

  def game_leader
    [human, computer].max
  end

  def prompt_play_again?
    choice = nil
    loop do
      puts "Would you like a rematch? (y/n)"
      choice = gets.strip.downcase
      break if ['y', 'n'].include? choice
      puts "Invalid input."
    end
    choice == 'y'
  end

  def play_round
    human.choose
    computer.choose
    display_round_result
    winner = round_winner
    winner.score += 1 unless winner.nil?
    display_score
  end

  public

  def play
    display_welcome_message
    loop do
      reset
      play_round until game_over?
      break unless prompt_play_again?
      display_rematch
    end
    display_goodbye_message
  end
end

RPSGame.new.play

=end
