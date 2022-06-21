require_relative 'player'
require_relative 'dealer'

user_name = gets.chomp.to_s
player = Player.new(user_name, 100)
dealer = Dealer.new(100)

loop do
  input = gets.chomp.to_i
  case input
  when 1
    player.pass
  when 2
    player.add_card
  when 3
    player.reveal_card
  end
    rescue StandartError
    puts "error"
end


