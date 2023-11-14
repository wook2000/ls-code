# yaml file with all text used within program
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

# Clear screen
def clear_terminal
  system("clear") || system("cls")
end

# Display message prompt on screen
def prompt(text)
  puts "=> #{text}"
end

# Fetch text from yaml file
def messages(message_option)
  MESSAGES[message_option]
end

# Welcome the user
def welcome_user(data_hash)
  prompt(messages('welcome'))
  get_user_name(data_hash)
  clear_terminal
  prompt("#{messages('hello')} #{data_hash[:user_name]}.")
  prompt(messages('description'))
  prompt(messages('continue'))
  return_to_continue
end

# Get user name and update hash
def get_user_name(data_hash)
  loop do
    data_hash[:user_name] = gets.chomp
    if data_hash[:user_name].empty?()
      prompt((messages('valid_name')))
    else
      break
    end
  end
end

# Get loan information and update hash
def get_loan_info(data_hash)
  loan_amount(data_hash)
  clear_terminal
  loan_apr(data_hash)
  clear_terminal
  loan_duration(data_hash)
end

# Press enter/return to continue
def return_to_continue
  gets
end

# Ask for loan amount
def loan_amount(data_hash)
  prompt("#{messages('get_started')} #{data_hash[:user_name]}!")
  prompt(messages('amount1'))
  prompt(messages('amount2'))
  get_loan_amount(data_hash)
end

# User inputs loan amount and update hash
def get_loan_amount(data_hash)
  loop do
    data_hash[:loan_amount] = gets.chomp
    if data_hash[:loan_amount][0] == "$"
      data_hash[:loan_amount] = data_hash[:loan_amount][1..-1]
    end
    break unless !number?(data_hash[:loan_amount])
    prompt(messages('valid_number'))
    prompt(messages('amount2'))
  end
end

# Ask for loan APR
def loan_apr(data_hash)
  prompt(messages('apr1'))
  prompt(messages('apr2'))
  get_loan_apr(data_hash)
end

# User inputs APR amount and update hash
def get_loan_apr(data_hash)
  loop do
    data_hash[:loan_apr] = gets.chomp
    if data_hash[:loan_apr][-1] == "%"
      data_hash[:loan_apr] = data_hash[:loan_apr].chop
    end
    break unless !number?(data_hash[:loan_apr])
    prompt(messages('valid_number'))
    prompt(messages('apr2'))
  end
end

# Ask for loan duration
def loan_duration(data_hash)
  prompt(messages('duration1'))
  prompt(messages('duration2'))
  get_loan_duration(data_hash)
end

# User inputs loan duration and update hash
def get_loan_duration(data_hash)
  loop do
    data_hash[:loan_duration] = gets.chomp
    break unless !number?(data_hash[:loan_duration])
    prompt(messages('valid_number'))
    prompt(messages('duration2'))
  end
end

# Validate that the input is an integer
def integer?(input)
  input.to_i.to_s == input.split('.')[0] if input.to_i == input.to_f
end

# Validate that the input is a float
def float?(input)
  input.to_f.to_s == input
end

# Validate that the input is a number
def number?(input)
  integer?(input) || float?(input)
end

# Calculate monthly payment
def calculate_payment(data_hash)
  monthly_rate = data_hash[:loan_apr].to_f / 1200
  data_hash[:loan_monthly_rate] = monthly_rate
  loan_duration_in_months = data_hash[:loan_duration].to_f * 12
  data_hash[:loan_term_months] = loan_duration_in_months
  loan_amount = data_hash[:loan_amount].to_f
  data_hash[:monthly_payment] = loan_amount *
                                (
                                  monthly_rate / 
                                  (
                                    1 - ((1 + monthly_rate)**(-loan_duration_in_months))
                                  )
                                )
end

# Display results
def display_loan_terms(data_hash)
  clear_terminal
  prompt(messages('pause'))
  sleep 1
  clear_terminal
  prompt(messages('results_overview'))
  prompt("#{messages('results_amount')} $#{data_hash[:loan_amount]}")
  prompt("#{messages('results_apr')} #{data_hash[:loan_apr].to_f.round(2)}%")
  prompt("#{messages('results_duration')} #{data_hash[:loan_duration]} years")
  prompt("#{messages('results_payment')} $#{data_hash[:monthly_payment].round(2)}")
  prompt(messages('continue'))
  return_to_continue
end

# Prompt for another round of calcuations
def calculate_again?(data_hash)
  prompt(messages('another_calc'))
  data_hash[:go_again?] = gets.chomp
end

# Exit program
def exit_calculator
  prompt(messages('exit'))
end

# Main calculator program
def mortgage_calculator_program
  loan_parameters = Hash.new

  clear_terminal
  welcome_user(loan_parameters)
  loop do
    loan_parameters[:go_again?] = ''
    clear_terminal
    get_loan_info(loan_parameters)
    calculate_payment(loan_parameters)
    display_loan_terms(loan_parameters)
    clear_terminal
    calculate_again?(loan_parameters)
    break unless loan_parameters[:go_again?].downcase.start_with?("y")
  end
  exit_calculator
end

# Run program
mortgage_calculator_program()
