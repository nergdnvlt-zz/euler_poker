require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/card.rb'

class CardTest < MiniTest::Test
  def test_it_exists
    card = Card.new('5H')

    assert_instance_of Card, card
  end

  def test_attributes
    card = Card.new('5H')
    val = card.value
    suit = card.suit

    whole_card_val = card.card

    assert_equal '5', val
    assert_equal 'H', suit
    assert_equal '5H', whole_card_val
  end
end
