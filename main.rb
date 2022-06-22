# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'game'

puts 'Blackjack game!'
puts 'Enter name:'

game = Game.new
game.new_player(gets.chomp.to_s)
game.new_dealer

game.greeting

loop do
  puts '1. Start new game'
  puts '2. Exit'
  input = gets.chomp.to_i
  case input
  when 1
    if game.player_has_money? && game.dealer_has_money?
      game.start_game
    elsif game.player_has_money?
      puts 'Dealer no have money'
      break
    else
      puts 'Your no have money'
      break
    end
  when 2
    break
  end
end
