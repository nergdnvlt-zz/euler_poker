require './lib/card'
require './lib/winning_hands'
require './lib/hand_evaluation'

class Hand
  include WinningHands
  include HandEvaluation
  attr_reader :cards, :ranks

  def initialize(card_string)
    @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    @cards = sort(card_string)
  end

  private

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
