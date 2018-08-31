require './lib/hand'

class Game
  attr_reader :player_1, :player_2

  def initialize(card_string)
    hand_1 = card_string.split[0..4].join(' ')
    hand_2 = card_string.split[5..9].join(' ')
    @player_1 = Hand.new(hand_1)
    @player_2 = Hand.new(hand_2)
    @winner = nil
  end

  def winner
    high_score
  end

  private

  def high_score
    if royal_flush?
      royal_flush
    end
  end

  def royal_flush?
    player_1.royal_flush? || player_2.royal_flush?
  end

  def royal_flush
    if player_1.royal_flush? && player_2.royal_flush?
      @winner = nil
    elsif player_1.royal_flush?
      @winner = @player_1
    end
  end

end
