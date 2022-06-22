require_relative 'player'
require_relative 'dealer'
require_relative 'game'

puts "Blackjack game!"
puts "Enter name:"
$user_name = gets.chomp.to_s
game = Game.new
game.new_player
game.new_dealer

loop do
  puts "1. Start new game"
  puts "2. Exit"
  input = gets.chomp.to_i
  case input
  when 1
    game.start_game
  when 2
    break
  end
    rescue StandartError
    puts "error"
end



