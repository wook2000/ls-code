module AdminMethods
  require 'yaml'

  MESSAGES = YAML.load_file('twentyone.yml')
    
  def prompt(txt)
    puts "=> #{txt}"
    puts
  end

  def fetch_yaml(msg_option)
    MESSAGES[msg_option]
  end

  def clear
    system 'clear'
  end

  def pause
    prompt(fetch_yaml('pause'))
    gets
  end
end

class Card
  SUITS = %w(H D S C)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  attr_reader :face, :suit
  attr_accessor :faced_up

  def initialize(suit, face)
    @suit = suit
    @face = face
    @faced_up = false
  end

  def to_s
    "#{face_value} of #{suit_type}"
  end

  def suit_type
    case suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def face_value
    case face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      face
    end
  end

  def ace?
    face == 'A'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    @cards.shuffle!
  end

  def deal_one_card
    cards.pop
  end
end

class Player
  include Comparable
  
  attr_accessor :hand, :score, :name, :stay

  def initialize
    reset
    @score = 0
  end

  def reset
    @hand = Hand.new
    @stay = false
  end

  def <=>(other)
    score <=> other.score
  end

  def dealt_card(card, faced_up)
    card.faced_up = faced_up
    hand.cards << card
  end

  def bust?
    hand.total > 21
  end
end

class Human < Player
  include AdminMethods
  
  def initialize
    super
    prompt_name 
  end

  def game_reset
    reset
    @score = 0
  end

  def prompt_name
    name = nil
    loop do
      prompt(fetch_yaml('human_name?'))
      name = gets.strip.squeeze(' ')
      break unless name.empty?
      prompt(fetch_yaml('not_valid'))
    end
    self.name = name
  end

  def action?
    action = nil
    loop do
      prompt(fetch_yaml('hit?'))
      action = gets.strip.squeeze(' ').downcase
      break if ['h', 's'].include? action
      prompt(fetch_yaml('not_valid'))
    end
    self.stay = action == 's' ? true : false
    !stay
  end
end

class Computer < Player
  POKER_PEEPS = ['Doyle Brunson', 'Kenny Rogers', 'Frank Sinatra', 'Lady Gaga']

  def initialize
    super
    pick_name 
  end

  def pick_name
    self.name = POKER_PEEPS.sample
  end

  def show_hand
    hand.cards[0].faced_up = true
  end

  def action?
    sleep 1.5
    self.stay = true if hand.total >= 17
    !stay
  end
end

class Hand
  include Comparable
  
  attr_accessor :cards, :total

  def initialize
    @cards = []
    @total = nil
  end

  def <=>(other)
    total <=> other.total
  end

  def total
    total = 0
    cards.each do |card|
      case card.face
      when 'A' then total += 11
      when 'J', 'Q', 'K' then total += 10
      else total += card.face.to_i
      end
    end
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def show
    top_bottom, blank, suit_ln, face_ln = "", "", "", ""
    cards.each do |card|
      top_bottom += "  ------  "
      blank += " |      | "
      suit_ln += card.faced_up ? " | #{card.suit}    | " : " |      | "
      face_ln += card.faced_up ? " |   #{card.face.rjust(2)} | " : " |      | "
    end
    puts top_bottom
    puts blank
    puts suit_ln
    puts blank
    puts face_ln
    puts blank
    puts top_bottom
    puts
  end
end

class TwentyOneGame
  include AdminMethods

  @@winning_points = nil
  
  def initialize
    clear
    display_welcome_message
    display_rules
    @human = Human.new
    @@winning_points = prompt_winning_points
  end

  def play
    lets_play
    display_goodbye_message
  end

  private

  attr_reader :human, :dealer, :deck
  attr_accessor :winner

  def lets_play
    loop do
      game_reset
      display_intro
      play_game until game_over?
      display_game_winner
      break unless play_again?
    end
  end

  def game_reset
    @deck = Deck.new
    @dealer = Computer.new
    human.game_reset
  end
  
  def prompt_winning_points
    points = nil
    prompt(fetch_yaml('points_intro'))
    loop do
      prompt(fetch_yaml('winning_points?'))
      points = gets.chomp.to_i
      break if points > 0 && points <= 5
      prompt(fetch_yaml('not_valid'))
    end
    @@winning_points = points
  end

  def play_game
    pause
    deal_and_play
    determine_winner
    winner.score += 1 unless winner.nil?
    display_points
    return if game_over?
    round_reset
  end

  def deal_and_play
    deal_cards
    human_turn
    return if human.bust?
    dealer_turn
  end

  def deal_cards
    human.dealt_card(deck.deal_one_card, true)
    dealer.dealt_card(deck.deal_one_card, false)
    human.dealt_card(deck.deal_one_card, true)
    dealer.dealt_card(deck.deal_one_card, true)
    display_table
  end

  def human_turn
    display_dealer_prompt_human_turn
    display_dealer_prompt_dealer_initial_hand
    take_turn(human)
  end

  def dealer_turn
    dealer.show_hand
    display_table
    display_dealer_prompt_dealer_turn
    take_turn(dealer)
  end

  def take_turn(player)
    display_dealer_prompt_hand(player)
    hit(player) until player.stay || player.bust?
    display_bust if player.bust?
    pause
  end

  def hit(player)
    return unless player.action?
    player.dealt_card(deck.deal_one_card, true)
    display_table
    display_dealer_prompt_hand(player)
  end

  def determine_winner
    self.winner = nil
    if human.bust? || (human.hand < dealer.hand && !dealer.bust?)
      self.winner = dealer
    elsif dealer.bust? || human.hand > dealer.hand
      self.winner = human
    end
    display_round_winner
  end

  def round_reset
    @deck = Deck.new
    human.reset
    dealer.reset
  end

  def game_over?
    game_leader.score >= @@winning_points
  end

  def game_leader
    [human, dealer].max
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

  # display methods

  def display_welcome_message
    prompt(fetch_yaml('welcome'))
  end

  def display_rules
    prompt(fetch_yaml('rules'))
  end

  def display_goodbye_message
    prompt(fetch_yaml('goodbye'))
  end

  def display_table
    clear
    prompt(human.name + fetch_yaml('whose_hand'))
    human.hand.show
    prompt(dealer.name + fetch_yaml('whose_hand'))
    dealer.hand.show
  end

  def display_intro
    prompt(fetch_yaml('dealer_name') + dealer.name)
    prompt(fetch_yaml('start_game'))
  end

  def display_dealer_prompt_human_turn
    prompt(human.name + fetch_yaml('human_turn'))
  end

  def display_dealer_prompt_hand(player)
    message = player.name == human.name ? 'human_cards' : 'dealer_cards'
    prompt(fetch_yaml(message))
    display_cards_in_hand(player)
  end

  def display_cards_in_hand(player)
    player.hand.cards.each { |card| puts "- #{card}" }
    puts
    prompt(fetch_yaml('current_total') + player.hand.total.to_s)    
  end

  def display_dealer_prompt_dealer_initial_hand
    prompt("#{fetch_yaml('dealer_flop')} #{dealer.hand.cards[1]}.")
  end

  def display_bust
    prompt(fetch_yaml('bust'))
    # pause
  end

  def display_dealer_prompt_dealer_turn
    prompt(fetch_yaml('dealer_turn'))
  end

  def display_dealer_prompt_dealer_hand
    prompt(fetch_yaml('dealer_cards'))
    display_cards_in_hand(dealer)    
  end

  def display_round_winner
    display_table
    if winner.nil?
      prompt(fetch_yaml('tie'))
      return
    end
    prompt(winner.name + fetch_yaml('round_to'))
  end

  def display_points
    prompt(fetch_yaml('display_header'))
    prompt(fetch_yaml('display_line'))
    prompt(human.name.ljust(17) + human.score.to_s)
    prompt(dealer.name.ljust(17) + dealer.score.to_s)
    puts
  end
  
  def display_game_winner
    prompt(game_leader.name + fetch_yaml('winner'))
  end
end

game = TwentyOneGame.new
game.play