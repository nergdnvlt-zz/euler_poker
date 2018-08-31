require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/game.rb'

class GameTest < MiniTest::Test
  # def test_it_exists
  #   game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')
  #
  #   assert_instance_of Game, game
  # end
  #
  # def test_it_makes_two_hands
  #   game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')
  #
  #   player_1 = game.player_1
  #   player_2 = game.player_2
  #
  #   assert_equal player_1.cards[0].card, '5H'
  #   assert_equal player_1.cards[1].card, '5C'
  #   assert_equal player_1.cards[2].card, '6S'
  #   assert_equal player_1.cards[3].card, '7S'
  #   assert_equal player_1.cards[4].card, 'KD'
  #
  #   assert_equal player_2.cards[0].card, '2C'
  #   assert_equal player_2.cards[1].card, '3S'
  #   assert_equal player_2.cards[2].card, '8S'
  #   assert_equal player_2.cards[3].card, '8D'
  #   assert_equal player_2.cards[4].card, 'TD'
  # end

  def test_royal_flush_wins_player_1
    game = Game.new('TS JS QS KS AS 9D TD JD QD KD')

    player_1 = game.player_1
    winner = game.winner
    assert_equal player_1, winner
  end

  def test_royal_flush_wins_player_2
    game = Game.new('9D TD JD QD KD TC JC QC KC AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end
end
