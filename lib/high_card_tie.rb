module HighCardTie
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
end
