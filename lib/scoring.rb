module Scoring
  def high_score
    if royal_flush?
      royal_flush
    elsif straight_flush?
      straight_flush
    elsif four_of_a_kind?
      four_of_a_kind
    elsif full_house?
      full_house
    elsif flush?
      flush
    elsif straight?
      straight
    elsif three_of_a_kind?
      three_of_a_kind
    elsif two_pair?
      two_pair
    elsif one_pair?
      one_pair
    else
      high_card
    end
  end

  def royal_flush?
    player_1.royal_flush? || player_2.royal_flush?
  end

  def straight_flush?
    player_1.straight_flush? | player_2.straight_flush?
  end

  def four_of_a_kind?
    player_1.four_of_a_kind? || player_2.four_of_a_kind?
  end

  def full_house?
    player_1.full_house? || player_2.full_house?
  end

  def flush?
    player_1.flush? || player_2.flush?
  end

  def straight?
    player_1.straight? || player_2.straight?
  end

  def three_of_a_kind?
    player_1.three_of_a_kind? || player_2.three_of_a_kind?
  end

  def two_pair?
    player_1.two_pair? || player_2.two_pair?
  end

  def one_pair?
    player_1.one_pair? || player_2.one_pair?
  end

  def high_card
    if player_1_high_card == player_2_high_card
      break_nested_flush_tie_1_deep
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end
end
