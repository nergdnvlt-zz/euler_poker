require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/hand.rb'

class HandTest < MiniTest::Test
  def test_it_exists
    hand = Hand.new('5H 5C 6S 7S KD')

    assert_instance_of Hand, hand
  end

  def test_it_sorts_hand
    hand = Hand.new('6S 5H 5C 7S KD')

    cards = hand.cards

    assert_equal cards[0].card, '5H'
    assert_equal cards[1].card, '5C'
    assert_equal cards[2].card, '6S'
    assert_equal cards[3].card, '7S'
    assert_equal cards[4].card, 'KD'
  end

  def test_it_sorts_hand_all_faces
    hand = Hand.new('AS TH QC KS JD')

    cards = hand.cards

    assert_equal cards[0].card, 'TH'
    assert_equal cards[1].card, 'JD'
    assert_equal cards[2].card, 'QC'
    assert_equal cards[3].card, 'KS'
    assert_equal cards[4].card, 'AS'
  end

  def test_it_has_royal_flush
    hand = Hand.new('AS QS JS KS TS')

    result = hand.royal_flush?

    assert result
  end

  def test_it_has_straight_flush
    hand = Hand.new('2S 3S 4S 5S 6S')

    result = hand.straight?

    assert result
    refute hand.royal_flush?
  end

  def test_it_has_other_straight_flush
    hand = Hand.new('7C 8C 9C TC JC')

    result = hand.straight?

    assert result
    refute hand.royal_flush?
  end

  def test_it_has_four_of_a_kind
    hand = Hand.new('8S 8D 8H 8S 4C')

    result = hand.four_of_a_kind?

    assert result
    refute hand.royal_flush?
    refute hand.straight?
  end

  def test_it_has_other_four_of_a_kind
    hand = Hand.new('KC KD KH KS 8S')

    result = hand.four_of_a_kind?

    assert result
    refute hand.royal_flush?
    refute hand.straight?
  end

  def test_full_house
    hand = Hand.new('3C 3D 3S 9S 9D')

    result = hand.full_house?
    assert result
    refute hand.straight?
    refute hand.four_of_a_kind?
  end

  def test_other_full_house
    hand = Hand.new('8C 8D 8S QS QD')

    result = hand.full_house?

    assert result
    refute hand.straight?
    refute hand.four_of_a_kind?
  end

  def test_flush
    hand = Hand.new('AS 2S 4S 8S TS')

    result = hand.flush?

    assert result
    refute hand.straight?
    refute hand.four_of_a_kind?
  end

  def test_other_flush
    hand = Hand.new('QC JC 2C 6C 8C')

    result = hand.flush?

    assert result
    refute hand.straight?
    refute hand.four_of_a_kind?
  end

  def test_straight
    hand = Hand.new('2C 3S 4H 5D 6C')

    result = hand.straight?

    assert result
    refute hand.four_of_a_kind?
    refute hand.flush?
  end

  def test_other_straight
    hand = Hand.new('6C 7S 8H 9D TC')

    result = hand.straight?

    assert result
    refute hand.four_of_a_kind?
    refute hand.flush?
  end

  def test_three_of_a_kind
    hand = Hand.new('6C 6S 6H 8D TC')

    result = hand.three_of_a_kind?

    assert result
    refute hand.four_of_a_kind?
    refute hand.flush?
    refute hand.straight?
  end

  def test_other_three_of_a_kind
    hand = Hand.new('8C 8S 8D TC AH')

    result = hand.three_of_a_kind?

    assert result
    refute hand.four_of_a_kind?
    refute hand.flush?
    refute hand.straight?
  end

  def test_two_pairs
    hand = Hand.new('8S 8D TC TH AS')

    result = hand.two_pair?

    assert result
    refute hand.four_of_a_kind?
    refute hand.flush?
    refute hand.straight?
    refute hand.three_of_a_kind?
  end

  def test_other_two_pairs
    hand = Hand.new('3S 3D 4C 4H 8S')

    result = hand.two_pair?

    assert result

    refute hand.four_of_a_kind?
    refute hand.flush?
    refute hand.straight?
    refute hand.three_of_a_kind?
  end

  def test_one_pair
    hand = Hand.new('8S 8D 4C 6H 2S')

    result = hand.one_pair?

    assert result
    refute hand.flush?
    refute hand.straight?
    refute hand.three_of_a_kind?
    refute hand.two_pair?
  end

  def test_other_one_pair
    hand = Hand.new('AS 4C 6H 2S AD')

    result = hand.one_pair?

    assert result
    refute hand.flush?
    refute hand.straight?
    refute hand.three_of_a_kind?
    refute hand.two_pair?
  end

  def test_high_ranking
    hand = Hand.new('6S 5H 2C 7S KD')

    result = hand.ranked_values
    assert_equal result, ['K', '7', '6', '5', '2']
  end
end
