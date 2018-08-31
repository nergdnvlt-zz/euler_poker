require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/game.rb'

class GameTest < MiniTest::Test
  def test_it_exists
    game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')

    assert_instance_of Game, game
  end

  def test_it_makes_two_hands
    game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')

    player_1 = game.player_1
    player_2 = game.player_2

    assert_equal player_1.cards[0].card, '5H'
    assert_equal player_1.cards[1].card, '5C'
    assert_equal player_1.cards[2].card, '6S'
    assert_equal player_1.cards[3].card, '7S'
    assert_equal player_1.cards[4].card, 'KD'

    assert_equal player_2.cards[0].card, '2C'
    assert_equal player_2.cards[1].card, '3S'
    assert_equal player_2.cards[2].card, '8S'
    assert_equal player_2.cards[3].card, '8D'
    assert_equal player_2.cards[4].card, 'TD'
  end

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

  def test_both_have_royal_flush
    game = Game.new('TS JS QS KS AS TC JC QC KC AC')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_straight_flush_player_1
    game = Game.new('9D TD JD QD KD 3C 2C TC 8C AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_straight_flush_player_2
    game = Game.new('9D 9C 9S KS KD 2C 3C 4C 5C 6C')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_tie_straight_flush_player_1
    game = Game.new('6D 7D 8D 9D TD 2C 3C 4C 5C 6C')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_tie_straight_flush_player_2
    game = Game.new('6D 7D 8D 9D TD 7C 8C 9C TC JC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_real_tie_straight_flush
    game = Game.new('6D 7D 8D 9D TD 6C 7C 8C 9C TC')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_straight_flush_player_1
    game = Game.new('9D TD JD QD KD 3C 2C TC 8C AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end
end
