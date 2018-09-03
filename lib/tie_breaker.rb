require './lib/high_card_tie'
require './lib/nested_pair_ties'

module TieBreaker
  include HighCardTie
  include NestedPairTies

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

  def break_pair_tie
    if player_1_single_pair_height == player_2_single_pair_height
      brake_nested_one_pair_tie
    elsif player_1_single_pair_height > player_2_single_pair_height
      @winner = @player_1
    elsif player_2_single_pair_height > player_1_single_pair_height
      @winner = @player_2
    end
  end
end
