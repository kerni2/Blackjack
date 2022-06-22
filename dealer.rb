class Dealer < Player
  attr_accessor :money, :cards, :cards_value, :quality_a, :deck

  def initialize(money)
    @money = money
    @cards = []
    @cards_value = []
    @quality_a = 0

  end

end
