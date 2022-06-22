# frozen_string_literal: true

class Player
  attr_accessor :name, :money, :cards, :cards_value, :quality_a, :score

  def initialize(name, money)
    @name = name
    @money = money
    @cards = []
    @cards_value = []
    @quality_a = 0
    @score = 0
  end

  def set_default
    @cards = []
    @cards_value = []
    @quality_a = 0
    @score = 0
  end

  def take_card
    new_card = game_deck.deck[0]
    @cards << new_card
    game_deck.shift
    @cards_value << (check(new_card))
  end

  def check(card)
    if card.to_s.length == 3
      '10'
    elsif card.split(//).first.eql?('Q')
      '10'
    elsif card.split(//).first.eql?('J')
      '10'
    elsif card.split(//).first.eql?('K')
      '10'
    elsif card.split(//).first.eql?('A')
      @quality_a += 1
      'A'
    else
      card.split(//).first
    end
  end

  def get_score
    score = 0
    @cards_value.each { |card| score += card.to_i }
    if @quality_a == 1 && score <= 10
      score += 11
    elsif @quality_a == 2 && score <= 9
      score += 12
    elsif @quality_a == 3 && score <= 8
      score += 13
    elsif score > 10
      score += @quality_a
    else
      score
    end
    @score = score
  end

  def deposit_money
    @money -= 10
  end

  def cards_hand
    hand = 0
    @cards.each { |_x| hand += 1 }
    hand
  end
end
