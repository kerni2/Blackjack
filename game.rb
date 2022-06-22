class Game
  attr_accessor :player, :dealer, :game_deck

  def initialize
    @player = player
    @dealer = dealer
    @game_deck = []
  end

  def new_player
    @player = Player.new($user_name, 100)
  end

  def new_dealer
    @dealer = Dealer.new(100)
  end

  def deck
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits = ['♦', '♠', '♥', '♣']
    suits.each { |suit| values.each { |value| @game_deck << value+suit } }
    @game_deck.shuffle!
  end

  def start_game
    puts "Start new game"
    puts
    player.deposit_money
    dealer.deposit_money
    deck
    give_card_player
    give_card_player
    give_card_dealer
    give_card_dealer
    puts "Your cards:"
    player.cards.each { |x| print "#{x} " }
    puts
    puts "Dealer cards:"
    dealer.cards.each { |x| print "* " }
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



end
