module NestedPairTies
  def break_nested_two_pair_tie
    if player_1_two_pair_next_highest == player_2_two_pair_next_highest
      break_double_nested_two_pair_tie
    elsif player_1_two_pair_next_highest > player_2_two_pair_next_highest
      @winner = @player_1
    elsif player_2_two_pair_next_highest > player_1_two_pair_next_highest
      @winner = @player_2
    end
  end

  def break_double_nested_two_pair_tie
    if player_1_two_pair_other_card == player_2_two_pair_other_card
      @winner = 'tie'
    elsif player_1_two_pair_other_card > player_2_two_pair_other_card
      @winner = @player_1
    elsif player_2_two_pair_other_card > player_1_two_pair_other_card
      @winner = @player_2
    end
  end

  def brake_nested_one_pair_tie
    if player_1_highest_single_card == player_2_highest_single_card
      break_single_pair_double_nested
    elsif player_1_highest_single_card > player_2_highest_single_card
      @winner = @player_1
    elsif player_2_highest_single_card > player_1_highest_single_card
      @winner = @player_2
    end
  end

  def break_single_pair_double_nested
    if player_1_next_highest_single_card == player_2_next_highest_single_card
      break_single_pair_triple_nested
    elsif player_1_next_highest_single_card > player_2_next_highest_single_card
      @winner = @player_1
    elsif player_2_next_highest_single_card > player_1_next_highest_single_card
      @winner = @player_2
    end
  end

  def break_single_pair_triple_nested
    if player_1_lowest_single_card == player_2_lowest_single_card
      @winner = 'tie'
    elsif player_1_lowest_single_card > player_2_lowest_single_card
      @winner = @player_1
    elsif player_2_lowest_single_card > player_1_lowest_single_card
      @winner = @player_2
    end
  end
end
