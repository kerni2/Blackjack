class Player
  attr_accessor :name, :money, :cards, :cards_value, :quality_a

  def initialize(name, money)
    @name = name
    @money = money
    @cards = []
    @cards_value = []
    @quality_a = 0
  end

  def take_card
    new_card = game_deck.deck[0]
    @cards << new_card
    game_deck.shift
    @cards_value << (check(new_card))
  end

  def check(card)
    if card.to_s.length == 3
      return "10"
    elsif card.split(//).first.eql?('Q')
      return "10"
    elsif card.split(//).first.eql?('J')
      return "10"
    elsif card.split(//).first.eql?('K')
      return "10"
    elsif card.split(//).first.eql?('A')
      @quality_a += 1
      return "A"
    else
      card.split(//).first
    end
  end

  def get_score
    score = 0
    @cards_value.each { |card| score += card.to_i }
    if @quality_a == 1 && score < 10
      score += 11
     elsif @quality_a == 2 && score <= 9
      score += 12
    elsif @quality_a == 3 && score <= 8
      score += 13
    elsif score >= 10
      score += @quality_a
    else
      score
    end
    puts score
  end

  def deposit_money
    @money -= 10
  end
end

