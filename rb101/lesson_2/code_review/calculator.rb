# yaml file with all text used within program, grouped by language
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Methods

# Clear screen
def clear
  system("clear") || system("cls")
end

# Initialize variables
def initialize_variables
  @lang = ''
  @name = ''
  @number1 = ''
  @number2 = ''
  @operator = ''
  @calculate_again = ''
end

# Print program-generated message with a '=>' prompt
def prompt(message)
  puts "=> #{message}"
end

# Set language
def set_language
  prompt(messages('language_prompt'))
  loop do
    language_input = gets.chomp.downcase
    @lang = language_input[0, 2]
    if %w(en es it).include?(@lang)
      break
    else
      prompt(messages('valid_language'))
      sleep 1
      prompt(messages('select_language'))
    end
  end
end

# Fetch message from calculator_messages.yml with consideration to language
# English will be the default language in the absence of a language argument
def messages(message, language='en')
  MESSAGES[language][message]
end

# Onboard the user
def onboard
  prompt(messages('welcome', @lang))
  loop do
    @name = gets.chomp
    if @name.empty?()
      prompt((messages('valid_name', @lang)))
    else
      break
    end
  end
end

# Request number input from user
def get_number(number_order)
  user_input = ''
  loop do
    case number_order
    when 1 then prompt(messages('first_number', @lang))
    when 2 then prompt(messages('second_number', @lang))
    end
    user_input = gets.chomp
    break unless !number?(user_input)
    prompt(messages('valid_number', @lang))
  end
  user_input
end

# Validate that the input is an integer
def integer?(input)
  input.to_i.to_s == input
end

# Validate that the input is a float
def float?(input)
  input.to_f.to_s == input
end

# Validate that the input is a number
def number?(input)
  integer?(input) || float?(input)
end

# Determine operator for calculation
def get_operator
  prompt(messages('operator_prompt', @lang))
  loop do
    @operator = gets.chomp
    if %w(1 2 3 4).include?(@operator)
      break
    else
      prompt(messages('valid_operator', @lang))
    end
  end
end

# Confirm selected operation
def operation_to_message(op)
  case op
  when '1' then messages('adding', @lang)
  when '2' then messages('subtracting', @lang)
  when '3' then messages('multiplying', @lang)
  when '4' then messages('dividing', @lang)
  end
end

# Perform calculation
def perform_calc
  result = case @operator
           when '1' then @number1.to_i() + @number2.to_i()
           when '2' then @number1.to_i() - @number2.to_i()
           when '3' then @number1.to_i() * @number2.to_i()
           when '4'
             if @number2 == '0'
               return prompt(messages('zero_divide', @lang))
             else
               @number1.to_f() / @number2.to_f()
             end
           end
  prompt("#{messages('result', @lang)} #{result}!")
end

# Calculator
def calculator
  prompt("#{messages('hello', @lang)} #{@name}.")
  prompt(messages('begin', @lang))
  @number1 = get_number(1)
  @number2 = get_number(2)
  get_operator
  prompt("#{operation_to_message(@operator)} #{messages('two_numbers', @lang)}")
  sleep 0.5
  perform_calc
end

# Another round?
def go_again?
  prompt(messages('another_calc', @lang))
  @calculate_again = gets.chomp
end

# Offboard
def exit_calculator
  prompt("#{messages('thank_you', @lang)} #{@name}. #{messages('bye', @lang)}")
end

# Main program
clear
initialize_variables
set_language
clear
onboard
loop do
  clear
  calculator
  go_again?
  break unless @calculate_again.downcase.start_with?(messages('again', @lang))
end
exit_calculator
