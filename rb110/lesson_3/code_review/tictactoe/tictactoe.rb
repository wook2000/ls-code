=begin
Tic Tac Toe

1. Determine game settings - size of board, number of players, board makers
2. Coin toss to determine who will go first
3. Display the initial empty board.
4. Conduct a round and have all players mark a square
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #4.
8. Play again?
9. If yes, go to #1
10. Good by!
=end

require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('tictactoe.yml')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def clear_terminal
  system 'clear'
end

def prompt(txt)
  puts "=> #{txt}"
end

def fetch_yaml(msg_option)
  MESSAGES[msg_option]
end

def display_scores
end

def display_tile_num(grid, row)
  display_line = ''
  tile_num = ((grid * (row - 1) + 1)..(grid * row)).to_a
  0.upto(grid - 1) do |idx|
    display_line += tile_num[idx].to_s.rjust(2)
    display_line += "   |" if idx != grid - 1
  end
  puts display_line
end

def display_marker(grid, row, board)
  display_line = ''
  tile_num = ((grid * (row - 1) + 1)..(grid * row)).to_a
  0.upto(grid - 1) do |idx|
    display_line += "  "
    display_line += board[tile_num[idx]]
    display_line += "  |" if idx != grid - 1
  end
  puts display_line
end

def display_column_divide(grid)
  puts "     |" * (grid - 1)
end

def display_row_divide(grid)
  puts "-----" + "+-----" * (grid - 1)
end

def display_board(board, grid)
  clear_terminal
  display_scores
  1.upto(grid) do |row|
    display_tile_num(grid, row)
    display_column_divide(grid)
    display_marker(grid, row, board)
    display_column_divide(grid)
    display_row_divide(grid) if row != grid
  end
end

#   puts "You're the #{PLAYER_MARKER}. Computer is the #{COMPUTER_MARKER}."
#   puts ""
#   puts "     |     |"
#   puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
#   puts "     |     |"
#   puts "-----+-----+-----"
#   puts "     |     |"
#   puts "  #{brd[5]}  |  #{brd[6]}  |  #{brd[7]}"
#   puts "     |     |"
#   puts "-----+-----+-----"
#   puts "     |     |"
#   puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
#   puts "     |     |"
#   puts ""
# end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, That is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
       brd[line[1]] == COMPUTER_MARKER &&
       brd[line[2]] == COMPUTER_MARKER
       return 'Computer'
    end
  end
  nil
end

# loop do
#   board = initialize_board

#   loop do
#     display_board(board)

#     player_places_piece!(board)
#     break if someone_won?(board) || board_full?(board)

#     computer_places_piece!(board)
#     break if someone_won?(board) || board_full?(board)
#   end

#   display_board(board)

#   if someone_won?(board)
#     prompt "#{detect_winner(board)} won!"
#   else
#     prompt "It's a tie!"
#   end

#   prompt "Play again (y or n)"
#   answer = gets.chomp
#   break unless answer.downcase.start_with?('y')
# end

# prompt "Thanks for playing Tic Tac Toe! Good bye!"

def welcome_player(name)
  clear_terminal
  prompt(fetch_yaml('welcome'))
  get_player_name(name)
  prompt("#{fetch_yaml('hello')} #{name}!")
  prompt(fetch_yaml('description'))
  return_to_continue
  prompt(fetch_yaml('description2'))
  return_to_continue
end

def get_player_name(name)
  loop do
    name.replace(gets.chomp)
    if not_valid_string?(name)
      prompt((fetch_yaml('valid_name')))
    else
      break
    end
  end
  clear_terminal
end

def not_valid_string?(str)
  str.strip.empty?()
end

def return_to_continue
  prompt(fetch_yaml('continue'))
  gets
  clear_terminal
end

def choose_game_setting(setting_hash, player_profile)
  clear_terminal
  prompt(fetch_yaml('description'))
  set_board_size
  set_number_of_players
  set_markers
end

def set_board_size
  prompt(fetch_yaml(''))
end

def set_number_of_players
end

def set_markers
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def play_game(board, grid, player_profile)
  loop do
    display_board(board, grid)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

def display_board(board, grid, score_tally)
  clear_terminal
  display_scores(score_tally)
  1.upto(grid) do |row|
    display_tile_num(grid, row)
    display_column_divide(grid)
    display_marker(grid, row, board)
    display_column_divide(grid)
    display_row_divide(grid) if row != grid
  end
end

def display_scores
  puts "Score"
  puts computer_score.to_s.rjust(5) + 
       "  Guardian".ljust(15) + 
       "(" + computer_marker + ")"
  puts player1_score.to_s.rjust(5) + 
       "  Guardian".ljust(15) + 
       "(" + computer_marker + ")"
end

def display_tile_num(grid, row)
  display_line = ''
  tile_num = ((grid * (row - 1) + 1)..(grid * row)).to_a
  0.upto(grid - 1) do |idx|
    display_line += tile_num[idx].to_s.rjust(2)
    display_line += "   |" if idx != grid - 1
  end
  puts display_line
end

def display_marker(grid, row, board)
  display_line = ''
  tile_num = ((grid * (row - 1) + 1)..(grid * row)).to_a
  0.upto(grid - 1) do |idx|
    display_line += "  "
    display_line += board[tile_num[idx]]
    display_line += "  |" if idx != grid - 1
  end
  puts display_line
end

def display_column_divide(grid)
  puts "     |" * (grid - 1)
end

def display_row_divide(grid)
  puts "-----" + "+-----" * (grid - 1)
end

def display_final_results
  clear_terminal
end

def play_again?
  clear_terminal
  prompt(fetch_yaml('play_again'))
  gets.chomp.downcase
end

def exit_game
  clear_terminal
  prompt(fetch_yaml('exit'))
end

# Main tictactoe program
def tictactoe
  player1 = ''
  welcome_player(player1)
  loop do
    settings = {}
    names_and_score = {computer: {name: 'Guardian', score: ''},
                       player1: {name: player1, score: ''}}
  #   choose_game_setting(settings, names_and_score)
  #   board = initialize_board
  #   play_game(board, settings[grid], names_and_score)
  #   display_final_results
    another_game = play_again?
    break unless another_game.start_with?('y')
  end
  exit_game
end

# Run program
tictactoe()