require 'yaml'

MESSAGES = YAML.load_file('tictactoe.yml')

def prompt(txt)
  puts "=> #{txt}"
end

def fetch_yaml(msg_option)
  MESSAGES[msg_option]
end

class Board
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    squares[num].marker = marker
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def center_empty?
    squares[5].unmarked?
  end

  def full?
    unmarked_keys.empty?
  end

  def win?
    WINNING_LINES.any? { |line| three_markers?(squares.values_at(*line)) }
  end

  def defense_opportunity(opponent)
    opportunity_squares = []
    WINNING_LINES.each do |line|
      opportunity = opportunity_square(squares, line, opponent.marker)
      if opportunity
        opportunity_squares << opportunity
      end
    end
    opportunity_squares.intersection(unmarked_keys)
  end

  def offense_opportunity(player)
    opportunity_squares = []
    WINNING_LINES.each do |line|
      opportunity = opportunity_square(squares, line, player.marker)
      if opportunity
        opportunity_squares << opportunity
      end
    end
    opportunity_squares.intersection(unmarked_keys)
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts " 1     | 2     | 3"
    puts "       |       |"
    puts "   #{@squares[1]}   |   #{@squares[2]}   |   #{@squares[3]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts " 4     | 5     | 6"
    puts "       |       |"
    puts "   #{@squares[4]}   |   #{@squares[5]}   |   #{@squares[6]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts " 7     | 8     | 9"
    puts "       |       |"
    puts "   #{@squares[7]}   |   #{@squares[8]}   |   #{@squares[9]}"
    puts "       |       |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_markers?(squares_array)
    markers = squares_array.map(&:marker)
    !markers.any?(Square::INITIAL_MARKER) && markers.all?(markers.first)
  end

  def opportunity_square(squares_hash,line, marker)
    markers = squares_hash.values_at(*line).map(&:marker)
    if markers.count(marker) == 2
      line.select{ |key| squares_hash[key].marker != marker }.first
    end
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  include Comparable
  attr_accessor :name, :score, :marker

  def initialize
    reset
  end

  def reset
    @score = 0
  end

  def ==(other)
    name == other.name
  end

  def <=>(other)
    score <=> other.score
  end
end

class Human < Player
  attr_accessor :board

  def initialize(board)
    super()
    @board = board
    prompt_name
    pick_marker
  end

  def prompt_name
    name = nil
    loop do
      prompt(fetch_yaml('player_name?'))
      name = gets.strip.squeeze(' ')
      break unless name.empty?
      prompt(fetch_yaml('not_valid'))
    end
    self.name = name
  end

  def pick_marker
    marker = nil
    loop do
      prompt(fetch_yaml('marker?'))
      marker = gets.strip
      break if marker.size == 1
      prompt(fetch_yaml('not_valid'))
    end
    self.marker = marker.upcase
  end

  def moves
    prompt(fetch_yaml('choose_square'))
    prompt("#{joinor(board.unmarked_keys)}")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      prompt(fetch_yaml('not_valid'))
    end
    board[square] = marker
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first.to_s
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end
end

# Credit to Nathan Johnson for this awesome random class initialization code!
class Computer < Player
  attr_accessor :opponent, :board

  def self.new_random(human, board)
    personas = ['Athena', 'Ares', 'Zeus', 'Bacchus']
    select_persona = personas.sample
    computer_class = case select_persona
                     when 'Athena' then Athena
                     when 'Ares' then Ares
                     when 'Zeus' then Zeus
                     when 'Bacchus' then Bacchus
                     end
    computer_class.new(select_persona, human, board)
  end

  def initialize(persona, human, board)
    super()
    self.name = persona
    pick_marker(human.marker)
    @opponent = human
    @board = board
  end

  def pick_marker(other_marker)
    self.marker = other_marker == 'X' ? 'O' : 'X'
  end
end

# Goddess of Protection - probably good at defense...
class Athena < Computer
  def moves
    if !board.defense_opportunity(opponent).empty?
      board[board.defense_opportunity(opponent).sample] = marker
    elsif board.center_empty?
      board[5] = marker
    else
      board[board.unmarked_keys.sample] = marker
    end
  end
end

# God of War - probably good at offense...
class Ares < Computer
  def moves
    if !board.offense_opportunity(self).empty?
      board[board.offense_opportunity(self).sample] = marker
    elsif board.center_empty?
      board[5] = marker
    else
      board[board.unmarked_keys.sample] = marker
    end
  end
end

# God of Gods - definitely good at everything
class Zeus < Computer
  def moves
    if !board.offense_opportunity(self).empty?
      board[board.offense_opportunity(self).sample] = marker
    elsif !board.defense_opportunity(opponent).empty?
      board[board.defense_opportunity(opponent).sample] = marker
    elsif board.center_empty?
      board[5] = marker
    else
      board[board.unmarked_keys.sample] = marker
    end
  end
end

# God of Wine - history's role model on playing while drinking...
class Bacchus < Computer
  def moves
    board[board.unmarked_keys.sample] = marker
  end
end

class CoinToss
  attr_accessor :call, :face_up, :winner
  attr_reader = :player1, :player2

  def initialize(human, computer)
    @player1 = human
    @player2 = computer
  end

  def reset
    human_declares
    self.face_up = ['h', 't'].sample
    self.winner = winner?
  end

  def human_declares
    loop do
      prompt(fetch_yaml('coin_toss'))
      self.call = gets.strip.squeeze(' ').downcase
      break if ['h', 't'].include? call
      prompt(fetch_yaml('not_valid'))
    end
  end

  def winner?
    call == face_up ? @player1 : @player2
  end
end

class TTTGame
  @@winnging_points = nil

  def initialize
    clear
    display_welcome_message
    @@winning_points = prompt_winning_points
    @board = Board.new
    @human = Human.new(board)
    @computer = Computer.new_random(human, board)
    @toss = CoinToss.new(human, computer)
  end

  def play
    display_game_setting
    lets_play
    display_goodbye_message
  end

  private

  attr_accessor :current_player, :winner
  attr_reader :board, :human, :computer, :toss

  def clear
    system 'clear'
  end

  def pause
    puts
    prompt(fetch_yaml('pause'))
    gets
  end

  # game engine

  def lets_play
    loop do
      game_reset
      play_game until game_over?
      display_winner
      break unless play_again?
      next_game
    end
  end

  def game_reset
    board.reset
    human.reset
    computer.reset
    toss.reset
    self.current_player = toss.winner
    display_toss_result
    display_first_player
    pause
  end

  def play_game
    display_board
    player_makes_move until round_over?
    display_round_result
    winner.score += 1 unless winner.nil?
    return if game_over?
    round_reset
  end

  def player_makes_move
    current_player.moves
    display_board
    self.current_player = current_player == human ? @computer : @human
  end

  def round_over?
    board.win? || board.full?
  end

  def round_reset
    board.reset
    display_next_round
    display_first_player
    pause
  end

  def game_over?
    game_leader.score >= @@winning_points
  end

  def game_leader
    [human, computer].max
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.strip.downcase
      break if %w(y n).include? answer
      prompt(fetch_yaml('not_valid'))
    end
    answer == 'y'
  end

  def next_game
    @computer = Computer.new_random(human, board)
    display_opponent
    @toss = CoinToss.new(human, computer)
  end

  # game setting

  def prompt_winning_points
    points = nil
    loop do
      prompt(fetch_yaml('points_intro'))
      prompt(fetch_yaml('winning_points?'))
      points = gets.chomp.to_i
      break if points > 0 && points <= 5
      prompt(fetch_yaml('not_valid'))
    end
    @@winning_points = points    
  end

  # display methods

  def display_welcome_message
    prompt(fetch_yaml('welcome'))
    puts
  end

  def display_win_condition
    puts
    prompt("#{fetch_yaml('win_condition1')} #{@@winning_points} " +
           "#{fetch_yaml('win_condition2')}")
    puts
  end

  def display_game_setting
    display_opponent
    display_win_condition
  end

  def display_opponent
    prompt("#{fetch_yaml('opponent')} #{computer.name}.")
  end

  def display_goodbye_message
    prompt(fetch_yaml('goodbye'))
  end

  def display_toss_result
    toss_result = toss.face_up == 'h' ? 'heads' : 'tails'
    prompt("#{fetch_yaml('toss_result')} #{toss_result}.")
  end

  def display_first_player
    prompt("#{current_player.name} #{fetch_yaml('first_player')}")
  end

  def display_board
    clear
    display_scores
    puts
    board.draw
    puts
  end

  def display_scores
    prompt(fetch_yaml('display_header'))
    prompt(fetch_yaml('display_line'))
    prompt(human.name.ljust(17) + human.marker.ljust(9) + human.score.to_s)
    prompt(computer.name.ljust(17) + computer.marker.ljust(9) + computer.score.to_s)
  end

  def display_round_result
    self.winner = nil
    if board.win?
      self.winner = current_player == human ? @computer : @human
      prompt("#{winner.name} #{fetch_yaml('win_round')}")
    else
      prompt(fetch_yaml('tie'))
    end
  end

  def display_next_round
    display_win_condition
    prompt(fetch_yaml('next_round'))
  end

  def display_winner
    clear
    display_board
    puts
    prompt("#{game_leader.name} #{fetch_yaml('win_game')}")
  end
end

game = TTTGame.new
game.play
