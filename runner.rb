require 'pry'
require './lib/game'

player1_wins = 0
player2_wins = 0
game_num = 0
file = File.open('./p054_poker.txt').readlines.each do |line|
  game = Game.new(line)
  game_num += 1
  if game.winner == game.player1
    player1_wins += 1
    puts "player 1 wins game #{game_num}"
  elsif game.winner == game.player2
    player2_wins += 1
    puts "player 2 wins game #{game_num}"
  end
end

puts "Player 1 total wins: #{player1_wins}"
puts "Player 2 total wins: #{player2_wins}"
