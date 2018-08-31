require 'pry'
require './lib/game'

player_1_wins = 0
player_2_wins = 0
tie_count = 0
game_num = 0

file = File.open('./p054_poker.txt').readlines.each do |line|
  game = Game.new(line)
  game_num += 1
  if game.winner == game.player_1
    player_1_wins += 1
    puts "player 1 wins game #{game_num}"
  elsif game.winner == game.player_2
    player_2_wins += 1
    puts "player 2 wins game #{game_num}"
  elsif game.winner == 'tie'
    tie_count += 1
    puts "Tie for game #{game_num}"
  end
end

puts "Player 1 total wins: #{player_1_wins}"
puts "Player 2 total wins: #{player_2_wins}"
puts "Total number of ties: #{tie_count}"
