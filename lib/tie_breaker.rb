module TieBreaker
  def break_with_single_high_card
    if player_1_high_card == player_2_high_card
      @winner = 'tie'
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
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

  def break_full_house_tie
    if player_1_3_kind_height > player_2_3_kind_height
      @winner = @player_1
    elsif player_2_3_kind_height > player_1_3_kind_height
      @winner = @player_2
    end
  end

  def break_flush_tie
    if player_1_high_card == player_2_high_card
      break_high_card_tie
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end

  def break_high_card_tie
    if player_1_second_high_card == player_2_second_high_card
      break_high_card_tie_2nd_level_down
    elsif player_1_second_high_card > player_2_second_high_card
      @winner = @player_1
    elsif player_2_second_high_card > player_1_second_high_card
      @winner = @player_2
    end
  end

  def break_high_card_tie_2nd_level_down
    if player_1_third_high_card == player_2_third_high_card
      break_high_card_tie_3rd_level_down
    elsif player_1_third_high_card > player_2_third_high_card
      @winner = @player_1
    elsif player_2_third_high_card > player_1_third_high_card
      @winner = @player_2
    end
  end

  def break_high_card_tie_3rd_level_down
    if player_1_fourth_high_card == player_2_fourth_high_card
      break_high_card_tie_4th_level_down
    elsif player_1_fourth_high_card > player_2_fourth_high_card
      @winner = @player_1
    elsif player_2_fourth_high_card > player_1_fourth_high_card
      @winner = @player_2
    end
  end

  def break_high_card_tie_4th_level_down
    if player_1_lowest_card == player_2_lowest_card
      @winner = 'tie'
    elsif player_1_lowest_card > player_2_lowest_card
      @winner = @player_1
    elsif player_2_lowest_card > player_1_lowest_card
      @winner = @player_2
    end
  end

  def break_three_of_a_kind_tie
    if player_1_3_kind_height > player_2_3_kind_height
      @winner = @player_1
    elsif player_2_3_kind_height > player_1_3_kind_height
      @winner = @player_2
    end
  end

  def break_two_pair_tie
    if player_1_two_pair_highest == player_2_two_pair_highest
      break_nested_two_pair_tie
    elsif player_1_two_pair_highest > player_2_two_pair_highest
      @winner = @player_1
    elsif player_2_two_pair_highest > player_1_two_pair_highest
        @winner = @player_2
    end
  end

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

  def break_pair_tie
    if player_1_single_pair_height == player_2_single_pair_height
      brake_nested_one_pair_tie
    elsif player_1_single_pair_height > player_2_single_pair_height
      @winner = @player_1
    elsif player_2_single_pair_height > player_1_single_pair_height
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
