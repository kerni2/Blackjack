class Player
  attr_accessor :name, :money, :cards

  def initialize(name, money)
    @name = name
    @money = money
    @cards = []
  end

end
