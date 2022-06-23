# frozen_string_literal: true

class Game
  attr_accessor :player, :dealer, :game_deck

  def initialize
    @player = player
    @dealer = dealer
    @game_deck = []
  end

  def greeting
    puts "#{player.name}, let's play"
  end

  def new_player(user_name)
    @player = Player.new(user_name, 100)
  end

  def new_dealer
    @dealer = Dealer.new(100)
  end

  def player_has_money?
    player.money.positive?
  end

  def dealer_has_money?
    dealer.money.positive?
  end

  def deck
    values = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suits = ['♦', '♠', '♥', '♣']
    suits.each { |suit| values.each { |value| @game_deck << value + suit } }
    @game_deck.shuffle!
  end

  def start_game
    player.set_default
    dealer.set_default
    puts 'Start new game'
    puts
    player.deposit_money
    puts "Your money: #{player.money}"
    dealer.deposit_money
    puts "Dealer money: #{dealer.money}"
    deck
    give_card_player
    give_card_player
    give_card_dealer
    give_card_dealer
    show_player_card
    show_dealer_card
    player_choose
    dealer_choose
    case player.cards_hand
    when 3
      reveal_card
    when 2
      player_choose_end
    end
  end

  def show_player_card
    puts 'Your cards:'
    player.cards.each { |x| print "#{x} " }
    puts
  end

  def show_dealer_card
    puts 'Dealer cards:'
    dealer.cards.each { |_x| print '* ' }
    puts
  end

  def show_open_dealer_card
    puts 'Dealer cards:'
    dealer.cards.each { |x| print "#{x} " }
    puts
  end

  def give_card_player
    new_card = game_deck[0]
    player.cards << new_card
    game_deck.shift
    player.cards_value << player.check(new_card)
  end

  def give_card_dealer
    new_card = game_deck[0]
    dealer.cards << new_card
    game_deck.shift
    dealer.cards_value << dealer.check(new_card)
  end

  def player_choose
    loop do
      puts '1. Pass turn'
      puts '2. Add card'
      puts '3. Reveal card'
      input = gets.chomp.to_i
      case input
      when 1
        break
      when 2
        give_card_player
        break
      when 3
        reveal_card
        player.set_default
        dealer.set_default
        break
      end
    end
  end

  def player_choose_end
    loop do
      puts '1. Add card'
      puts '2. Reveal card'
      input = gets.chomp.to_i
      case input
      when 1
        give_card_player
        reveal_card
        player.set_default
        dealer.set_default
        break
      when 2
        reveal_card
        player.set_default
        dealer.set_default
        break
      end
    end
  end

  def dealer_choose
    give_card_dealer if dealer.get_score < 17
  end

  def reveal_card
    show_player_card
    player.get_score
    puts player.score
    show_open_dealer_card
    dealer.get_score
    puts dealer.score
    if player.get_score > 21 && dealer.get_score <= 21
      puts 'Dealer win'
      dealer.money += 20
    elsif player.get_score <= 21 && dealer.get_score > 21
      puts 'Your win'
      player.money += 20
    elsif player.get_score < dealer.get_score
      puts 'Dealer win'
      dealer.money += 20
    elsif player.get_score > dealer.get_score
      puts 'Your win'
      player.money += 20
    else
      puts 'No winner'
      player.money += 10
      dealer.money += 10
    end
  end
end
