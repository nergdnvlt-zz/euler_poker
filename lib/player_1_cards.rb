module Player1Cards
  def player_1_4_kind_height
    player_1.ranks.index(player_1.group_values[4][0])
  end

  def player_1_3_kind_height
    player_1.ranks.index(player_1.group_values[3][0])
  end

  def player_1_two_pair_highest
    player_1.ranks.index(player_1.group_values[2][-1])
  end

  def player_1_two_pair_next_highest
    player_1.ranks.index(player_1.group_values[2][0])
  end

  def player_1_two_pair_other_card
    player_1.ranks.index(player_1.group_values[1][0])
  end

  def player_1_single_pair_height
    player_1.ranks.index(player_1.group_values[2][0])
  end

  def player_1_highest_single_card
    player_1.ranks.index(player_1.group_values[1][-1])
  end

  def player_1_next_highest_single_card
    player_1.ranks.index(player_1.group_values[1][-2])
  end

  def player_1_lowest_single_card
    player_1.ranks.index(player_1.group_values[1][0])
  end

  def player_1_high_card
    player_1.ranks.index(player_1.cards[-1].value)
  end

  def player_1_second_high_card
    player_1.ranks.index(player_1.cards[-2].value)
  end

  def player_1_third_high_card
    player_1.ranks.index(player_1.cards[-3].value)
  end

  def player_1_fourth_high_card
    player_1.ranks.index(player_1.cards[-4].value)
  end

  def player_1_lowest_card
    player_1.ranks.index(player_1.cards[0].value)
  end
end
