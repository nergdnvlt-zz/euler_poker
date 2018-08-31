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
    elsif straight_flush?
      straight_flush
    elsif four_of_a_kind?
      four_of_a_kind
    end
  end

  def royal_flush?
    player_1.royal_flush? || player_2.royal_flush?
  end

  def royal_flush
    if player_1.royal_flush? && player_2.royal_flush?
      @winner = 'tie'
    elsif player_1.royal_flush?
      @winner = @player_1
    elsif player_2.royal_flush?
      @winner = @player_2
    end
  end

  def straight_flush?
    player_1.straight_flush? | player_2.straight_flush?
  end

  def straight_flush
    if player_1.straight_flush? && player_2.straight_flush?
      break_straight_flush_tie
    elsif player_1.straight_flush?
      @winner = @player_1
    elsif player_2.straight_flush?
      @winner = @player_2
    end
  end

  def break_straight_flush_tie
    if player_1_high_card == player_2_high_card
      @winner = 'tie'
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end

  def four_of_a_kind?
    player_1.four_of_a_kind? || player_2.four_of_a_kind?
  end

  def four_of_a_kind
    if player_1.four_of_a_kind? && player_2.four_of_a_kind?
      break_four_of_a_kind_tie
    elsif player_1.four_of_a_kind?
      @winner = @player_1
    elsif player_2.four_of_a_kind?
      @winner = @player_2
    end
  end

  def break_four_of_a_kind_tie
    if player_1_4_kind_height > player_2_4_kind_height
      @winner = @player_1
    elsif player_2_4_kind_height > player_1_4_kind_height
      @winner = @player_2
    end
  end

  def player_1_4_kind_height
    player_1.ranks.index(player_1.group_values[4][0])
  end

  def player_2_4_kind_height
    player_2.ranks.index(player_2.group_values[4][0])
  end

  def player_1_high_card
    @player_1.ranks.index(player_1.cards[-1].value)
  end

  def player_2_high_card
    @player_2.ranks.index(player_2.cards[-1].value)
  end
end
