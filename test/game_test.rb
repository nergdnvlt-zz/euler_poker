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

  def test_four_of_a_kind_player_1
    game = Game.new('8D 8S 8H 8C KD 3C 3D TC 9D AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_four_of_a_kind_player_2
    game = Game.new('5D 8S 8H 8C KD 3C 3D 3S 3H AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_four_of_a_kind__tie_player_1
    game = Game.new('8D 8S 8H 8C KD 3C 3D 3S 3H AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_four_of_a_kind__tie_player_2
    game = Game.new('8D 8S 8H 8C KD 9C 9D 9S 9H AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_full_house_player_1
    game = Game.new('8D 8S 8H KC KD 3C 3D TC 9D AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_full_house_player_2
    game = Game.new('8D 8S 6H KC KD 3C 3D 3S AD AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_full_house_tie_player_1
    game = Game.new('8D 8S 8H KC KD 3C 3D 3S AD AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_full_house_tie_player_2
    game = Game.new('8D 8S 8H KC KD TC TD TS AD AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_flush_player_1
    game = Game.new('2D 4D 5D TD KD 3C 3D TC 9D AC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_flush_player_2
    game = Game.new('2C 4S 5D TD KD 2D 3D TD 9D AD')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_tie_flush_player_1
    game = Game.new('2D 4D 5D TD KD 3C 2C TC 9C 6C')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_tie_flush_player_2
    game = Game.new('2D 4D 5D TD KD 3C 2C TC 9C AC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_nested_tie_flush_player_1
    game = Game.new('2D 4D 5D QD KD 3C 2C 8C TC KC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_nested_tie_flush_player_2
    game = Game.new('2D 4D 5D 9D KD 3C 2C 8C TC KC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_double_nested_tie_flush_player_1
    game = Game.new('2D 4D 8D QD KD 3C 2C 7C TC KC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_double_nested_tie_flush_player_2
    game = Game.new('2D 4D 8D QD KD 3C 2C TC QC KC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_triple_nested_tie_flush_player_1
    game = Game.new('2D 4D 8D QD KD 3C 2C 8C TC KC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_triple_nested_tie_flush_player_2
    game = Game.new('2D 4D 8D QD KD 5C 2C 8C TC KC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_quad_nested_tie_flush_player_1
    game = Game.new('3D 4D 8D QD KD 4C 2C 8C QC KC')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_quad_nested_tie_flush_player_2
    game = Game.new('2D 4D 8D QD KD 4C 3C 8C QC KC')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_straight_player_1
    game = Game.new('2C 3S 5D 4D 6D 2D 3D TH 9C AD')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_straight_player_2
    game = Game.new('AC 2D 3H 8S 7S 8D 9D TH JC QD')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_straight_tie_player_1
    game = Game.new('3H 4S 5S 6C 7D 2C 3S 5D 4D 6D')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_straight_tie_player_2
    game = Game.new('3H 4S 5S 6C 7D 5C 6S 7D 8D 9D')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_straight_tie_no_winner
    game = Game.new('3H 4S 5S 6C 7D 3C 4C 5D 6D 7S')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_three_of_a_kind_player_1
    game = Game.new('3H 3C 3D 2C 7D 2D 2C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_three_of_a_kind_player_1
    game = Game.new('3H 3C AD 4C 7D 2D 2C 2S 6H 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_three_of_a_kind__tie_player_1
    game = Game.new('3H 3C 3D 2C 7D 2D 2C 2S 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_three_of_a_kind__tie_player_2
    game = Game.new('3H 3C 3D 2C 7D 4D 4C 4S 6H 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_two_pair_player_1
    game = Game.new('3H 3C 4D 4C 7D 2D 2C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_two_pair_player_2
    game = Game.new('3H 2C 4D 4C 7D 2D 2C 5D 5H 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_two_pair_tie_player_1
    game = Game.new('3H 3C 5D 5C 7D 2D 2C 4H 4S 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_two_pair_tie_player_2
    game = Game.new('3H 3C 5D 5C 7D 2D 2C 6H 6S 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_two_pair_nested_tie_player_1
    game = Game.new('3H 3C 4D 4C 8D 2D 2C 4H 4S 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_two_pair_nested_tie_player_2
    game = Game.new('2H 2C 4D 4C 8D 3D 3C 4H 4S 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_two_pair_double_nested_tie_player_1
    game = Game.new('3H 3C 4D 4C 9D 3D 3S 4H 4S 8S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_two_pair_double_nested_tie_player_2
    game = Game.new('3H 3C 4D 4C 8D 3D 3S 4H 4S TS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_two_pair_double_nested_tie_no_winner
    game = Game.new('3H 3C 4D 4C 8D 3D 3S 4H 4S 8S')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_one_pair_player_1
    game = Game.new('3H 3C 2D 4C 7D 2D 3C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_one_pair_player_2
    game = Game.new('3H 8C 2D 4C 7D 2D 5C 5D 6H 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_one_pair_tie_player_1
    game = Game.new('3H 3C 2D 4C KD 2D 2C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_one_pair_tie_player_2
    game = Game.new('3H 3C 2D 4C KD 8D 8C 5D 6H 7S')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_one_pair_first_tie_player_1
    game = Game.new('3H 3C 2D 4C KD 3D 3C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_one_pair_first_tie_player_2
    game = Game.new('3H 3C 2D 4C QD 3D 3C 5D 6H KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_one_pair_double_tie_player_1
    game = Game.new('3H 3C 2D QC KD 3D 3C 5D 6H KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_one_pair_double_tie_player_2
    game = Game.new('3H 3C 2D 4C KD 3D 3C 5D QH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_one_pair_triple_tie_player_1
    game = Game.new('3H 3C TD QC KD 3D 3C 5D QH KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_one_pair_triple_tie_player_2
    game = Game.new('3H 3C 2D QC KD 3D 3C 5D QH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_one_pair_triple_tie_no_winner
    game = Game.new('3H 3C 5S QC KD 3D 3C 5D QH KS')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_high_card_player_1
    game = Game.new('3H 8C 2D 4C KD 2D 3C 5D 6H 7S')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_high_card_player_2
    game = Game.new('3H 8C 2D 4C QD 2D 3C 5D 6H KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_high_card_first_tie_player_1
    game = Game.new('3H 8C 2D JC KD 2D 3C 5D 6H KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_high_card_first_tie_player_2
    game = Game.new('3H 8C 2D TC KD 2D 3C 5D JH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_high_card_second_tie_player_1
    game = Game.new('3H 8C 2D JC KD 2D 3C 5D JH KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_high_card_second_tie_player_2
    game = Game.new('3H 8C 2D JC KD 2D 3C TD JH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_high_card_triple_tie_player_1
    game = Game.new('4H 8C 2D JC KD 2D 3C 8D JH KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_high_card_triple_tie_player_2
    game = Game.new('3H 2C TD JC KD 2D 5C TD JH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_high_card_quad_tie_player_1
    game = Game.new('4H 8C 3D JC KD 2D 4C 8D JH KS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_high_card_quad_tie_player_2
    game = Game.new('5H 2C TD JC KD 4D 5C TD JH KS')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_high_card_last_tie_no_winner
    game = Game.new('4H 8C 3D JC KD 3S 4C 8D JH KS')

    winner = game.winner

    assert_equal 'tie', winner
  end

  def test_hand_1
    game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_hand_2
    game = Game.new('5D 8C 9S JS AC 2C 5C 7D 8S QH')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_hand_3
    game = Game.new('2D 9C AS AH AC 3D 6D 7D TD QD')

    player_2 = game.player_2
    winner = game.winner

    assert_equal player_2, winner
  end

  def test_hand_4
    game = Game.new('4D 6S 9H QH QC 3D 6D 7H QD QS')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end

  def test_hand_5
    game = Game.new('2H 2D 4C 4D 4S 3C 3D 3S 9S 9D')

    player_1 = game.player_1
    winner = game.winner

    assert_equal player_1, winner
  end
end
