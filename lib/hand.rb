require './lib/card'
class Hand
  attr_reader :cards, :ranks

  def initialize(card_string)
    @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    @cards = sort(card_string)
  end

  def royal_flush?
    values_match?(8) && same_suit?
  end

  def straight_flush?
    values_match?(find_index) && same_suit?
  end

  def four_of_a_kind?
    group_values.keys.include?(4)
  end

  def full_house?
    group_values.keys.include?(3) && group_values.keys.include?(2)
  end

  def flush?
    same_suit?
  end

  def straight?
    values_match?(find_index)
  end

  def three_of_a_kind?
    group_values.keys.include?(3)
  end

  def two_pair?
    group_values.keys.include?(2) && group_values[2].count == 4
  end

  def one_pair?
    group_values.keys.include?(2) && group_values[2].count == 2
  end

  def ranked_values
    values.reverse
  end

  def group_values
    values.group_by { |value| values.count(value) }
  end

  private

  def group_suits
    suits.group_by { |value| suits.count(value) }
  end

  def find_index
    @ranks.index(@cards[0].value)
  end

  def same_suit?
    suits.uniq.count == 1
  end

  def suits
    @cards.map { |card| card.suit }
  end

  def values
    @cards.map { |card| card.value }
  end

  def values_match?(start)
    values == @ranks.slice(start, 5)
  end

  def sort(card_string)
    face_cards = ['T', 'J', 'Q', 'K', 'A']
    cards = sort_by_num(card_string)
    face_cards.each do |face|
      stack = []
      cards.each do |card|
        stack << card if card.value == face
      end
      cards = cards.delete_if { |card| card.value == face }
      cards = cards + stack
    end
    cards
  end

  def sort_by_num(card_string)
    make_cards(card_string).sort_by { |card| card.value }
  end

  def make_cards(card_string)
    card_string.split.map { |card| Card.new(card) }
  end
end
