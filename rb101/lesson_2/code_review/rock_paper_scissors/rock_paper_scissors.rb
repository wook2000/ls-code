require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors_messages.yml')
PLAYER_CHOICES = %w(rock paper scissors lizard spock)
WINNING_CONDITION = { rock: %w(scissors lizard),
                      paper: %w(rock spock),
                      scissors: %w(paper lizard),
                      lizard: %w(paper spock),
                      spock: %w(rock scissors) }
MAX_NUMBER_OF_ROUNDS = 9

def clear_terminal
  system("clear") || system("cls")
end

def display_prompt(text)
  puts "=> #{text}"
end

def fetch_yaml_message(message_option)
  MESSAGES[message_option]
end

def welcome_user(user)
  display_prompt(fetch_yaml_message('welcome'))
  get_user_name(user)
  clear_terminal
  display_prompt("#{fetch_yaml_message('hello')} #{user}!")
  display_prompt(fetch_yaml_message('description'))
  display_prompt(fetch_yaml_message('continue'))
  return_to_continue
end

def get_user_name(name)
  loop do
    name.replace(gets.chomp)
    if not_valid_string?(name)
      display_prompt((fetch_yaml_message('valid_name')))
    else
      break
    end
  end
end

def not_valid_string?(str)
  str.strip.empty?()
end

def return_to_continue
  gets
end

def set_game_length(rounds)
  display_prompt(fetch_yaml_message('get_started'))
  get_game_length(rounds)
  if rounds.to_i == 1
    display_prompt("#{rounds} #{fetch_yaml_message('game_length_one')}")
  else
    display_prompt("#{rounds} #{fetch_yaml_message('game_length_multiple')}")
  end
  display_prompt(fetch_yaml_message('continue'))
  return_to_continue
end

def get_game_length(rounds)
  loop do
    display_prompt(fetch_yaml_message('game_length'))
    rounds.replace(gets.chomp)
    if not_number?(rounds)
      display_prompt(fetch_yaml_message('game_length_not_number'))
    elsif negative_number?(rounds)
      display_prompt(fetch_yaml_message('game_length_negative'))
    elsif zero?(rounds)
      display_prompt(fetch_yaml_message('game_length_zero'))
    elsif fraction?(rounds)
      display_prompt(fetch_yaml_message('game_length_fraction'))
    elsif too_big_number?(rounds)
      display_prompt(fetch_yaml_message('game_length_too_long'))
    elsif even?(rounds)
      display_prompt(fetch_yaml_message('game_length_no_evens'))
    else
      break
    end
  end

end

def not_number?(input)
  !(integer?(input) || float?(input))
end

def integer?(input)
  input.to_i.to_s == input.split('.')[0] if input.to_i == input.to_f
end

def float?(input)
  input.to_f.to_s == input
end

def negative_number?(input)
  input.to_f < 0
end

def zero?(input)
  input.to_f == 0
end

def fraction?(input)
  input.to_f % 1 != 0
end

def too_big_number?(input)
  input.to_f > MAX_NUMBER_OF_ROUNDS
end

def even?(input)
  input.to_f % 2 == 0
end

def play_game(name, rounds, score_hash)
  round_count = 1
  loop do
    player_choice = ''
    guardian_choice = ''
    clear_terminal
    display_prompt(fetch_yaml_message('instruction'))
    display_scores(name, 'Guardian', round_count, rounds, score_hash)
    get_player_choice(player_choice)
    get_guardian_choice(guardian_choice)
    victor = determine_winner(player_choice, guardian_choice)
    update_scores(victor, score_hash)
    display_round_result(victor, player_choice, guardian_choice)
    display_prompt(fetch_yaml_message('continue'))
    return_to_continue
    round_count += 1 unless victor == 'tie'
    break unless round_count <= rounds.to_i
  end
end

def display_scores(player1, player2, current_round, total_rounds, score_hash)
  puts
  puts
  puts "Round #{current_round} of #{total_rounds}"
  puts
  puts "#{player1} #{score_hash[:player_score]} : #{player2} #{score_hash[:guardian_score]}"
  puts
  puts
end

def get_player_choice(selection)
  loop do
    display_prompt(fetch_yaml_message('player_selection'))
    input = gets.chomp.downcase
    shortened_choices = PLAYER_CHOICES.map { |choice| choice[0, input.size] }
    if not_valid_string?(input)
      display_prompt(fetch_yaml_message('valid_choice'))
      next
    elsif input == 's'
      display_prompt(fetch_yaml_message('scissors_spock'))
      next
    elsif shortened_choices.include?(input)
      selection.replace(PLAYER_CHOICES[shortened_choices.find_index(input)])
      break
    else
      display_prompt(fetch_yaml_message('valid_choice'))
    end
  end
end

def get_guardian_choice(selection)
  selection.replace(PLAYER_CHOICES.sample)
end

def determine_winner(selection1, selection2)
  if WINNING_CONDITION[:"#{selection1}"].include?(selection2)
    "player1"
  elsif WINNING_CONDITION[:"#{selection2}"].include?(selection1)
    "player2"
  else
    "tie"
  end
end

def update_scores(result, score_hash)
  if result == 'player1'
    score_hash[:player_score] += 1
  elsif result == 'player2'
    score_hash[:guardian_score] += 1
  end
end

def display_round_result(result, selection1, selection2)
  display_prompt("#{fetch_yaml_message('player_choice')} #{selection1}.")
  display_prompt("#{fetch_yaml_message('guardian_choice')} #{selection2}.")
  if result == 'player1'
    display_prompt(fetch_yaml_message('result_player'))
  elsif result == 'player2'
    display_prompt(fetch_yaml_message('result_guardian'))
  else
    display_prompt(fetch_yaml_message('result_tie'))
  end
end

def display_final_results(name, rounds, score_hash)
  winner = (score_hash[:player_score] > score_hash[:guardian_score]) ? name : 'guardian'
  display_prompt("#{name}, #{fetch_yaml_message('challenge')}.")
  display_prompt("#{fetch_yaml_message('best_of')} #{rounds} #{fetch_yaml_message('rounds')}" )
  display_prompt("#{fetch_yaml_message('obtain')} #{score_hash[:player_score]} #{fetch_yaml_message('win')}" )
  if winner == name
    display_prompt(fetch_yaml_message('player_win'))
  else
    display_prompt(fetch_yaml_message('guardian_win'))
  end
  display_prompt(fetch_yaml_message('continue'))
  return_to_continue
end

def play_again?()
  display_prompt(fetch_yaml_message('play_again'))
  gets.chomp.downcase
end

def exit_game()
  display_prompt(fetch_yaml_message('exit'))
end

# Main calculator program
def rock_paper_scissors_program
  user_name = ''

  clear_terminal
  welcome_user(user_name)
  loop do
    number_of_rounds = ''
    score_tally = { player_score: 0,
                    guardian_score: 0 }
    winner = ''
  
    clear_terminal
    set_game_length(number_of_rounds)
    play_game(user_name, number_of_rounds, score_tally)
    clear_terminal
    display_final_results(user_name, number_of_rounds, score_tally)
    clear_terminal
    play_again = play_again?
    break unless play_again.start_with?("y")
  end
  exit_game
end

# Run program
rock_paper_scissors_program()
