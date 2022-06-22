# frozen_string_literal: true

class Dealer < Player
  attr_accessor :money, :cards, :cards_value, :quality_a, :deck, :score

  def initialize(money)
    @money = money
    @cards = []
    @cards_value = []
    @quality_a = 0
    @score
  end
end
