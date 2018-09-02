module Player2Cards
  def player_2_4_kind_height
    player_2.ranks.index(player_2.group_values[4][0])
  end

  def player_2_3_kind_height
    player_2.ranks.index(player_2.group_values[3][0])
  end

  def player_2_two_pair_highest
    player_2.ranks.index(player_2.group_values[2][-1])
  end

  def player_2_two_pair_next_highest
    player_2.ranks.index(player_2.group_values[2][0])
  end

  def player_2_two_pair_other_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  def player_2_single_pair_height
    player_2.ranks.index(player_2.group_values[2][0])
  end

  def player_2_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-1])
  end

  def player_2_next_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-2])
  end

  def player_2_lowest_single_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  def player_2_high_card
    player_2.ranks.index(player_2.cards[-1].value)
  end

  def player_2_second_high_card
    player_2.ranks.index(player_2.cards[-2].value)
  end

  def player_2_third_high_card
    player_2.ranks.index(player_2.cards[-3].value)
  end

  def player_2_fourth_high_card
    player_2.ranks.index(player_2.cards[-4].value)
  end

  def player_2_lowest_card
    player_2.ranks.index(player_2.cards[0].value)
  end
end
