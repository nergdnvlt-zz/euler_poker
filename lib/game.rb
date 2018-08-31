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

  def full_house?
    player_1.full_house? || player_2.full_house?
  end

  def full_house
    if player_1.full_house? && player_2.full_house?
      break_full_house_tie
    elsif player_1.full_house?
      @winner = @player_1
    elsif player_2.full_house?
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

  def flush?
    player_1.flush? || player_2.flush?
  end

  def flush
    if player_1.flush? && player_2.flush?
      break_flush_tie
    elsif player_1.flush?
      @winner = @player_1
    elsif player_2.flush?
      @winner = @player_2
    end
  end

  def break_flush_tie
    if player_1_high_card == player_2_high_card
      break_nested_flush_tie_1_deep
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end

  def break_nested_flush_tie_1_deep
    if player_1_second_high_card == player_2_second_high_card
      break_double_nested_flush_tie
    elsif player_1_second_high_card > player_2_second_high_card
      @winner = @player_1
    elsif player_2_second_high_card > player_1_second_high_card
      @winner = @player_2
    end
  end

  def break_double_nested_flush_tie
    if player_1_third_high_card == player_2_third_high_card
      break_triple_nested_flush_tie
    elsif player_1_third_high_card > player_2_third_high_card
      @winner = @player_1
    elsif player_2_third_high_card > player_1_third_high_card
      @winner = @player_2
    end
  end

  def break_triple_nested_flush_tie
    if player_1_fourth_high_card == player_2_fourth_high_card
      break_quad_nested_flush_tie
    elsif player_1_fourth_high_card > player_2_fourth_high_card
      @winner = @player_1
    elsif player_2_fourth_high_card > player_1_fourth_high_card
      @winner = @player_2
    end
  end

  def break_quad_nested_flush_tie
    if player_1_lowest_card == player_2_lowest_card
      @winner = 'tie'
    elsif player_1_lowest_card > player_2_lowest_card
      @winner = @player_1
    elsif player_2_lowest_card > player_1_lowest_card
      @winner = @player_2
    end
  end

  def straight?
    player_1.straight? || player_2.straight?
  end

  def straight
    if player_1.straight? && player_2.straight?
      break_straight_tie
    elsif player_1.straight?
      @winner = @player_1
    elsif player_2.straight?
      @winner = @player_2
    end
  end

  def break_straight_tie
    if player_1_high_card == player_2_high_card
      @winner = 'tie'
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end

  def three_of_a_kind?
    player_1.three_of_a_kind? || player_2.three_of_a_kind?
  end

  def three_of_a_kind
    if player_1.three_of_a_kind? && player_2.three_of_a_kind?
      break_three_of_a_kind_tie
    elsif player_1.three_of_a_kind?
      @winner = @player_1
    elsif player_2.three_of_a_kind?
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

  def two_pair?
    player_1.two_pair? || player_2.two_pair?
  end

  def two_pair
    if player_1.two_pair? && player_2.two_pair?
      break_two_pair_tie
    elsif player_1.two_pair?
      @winner = @player_1
    elsif player_2.two_pair?
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

  def one_pair?
    player_1.one_pair? || player_2.one_pair?
  end

  def one_pair
    if player_1.one_pair? && player_2.one_pair?
      break_pair_tie
    elsif player_1.one_pair?
      @winner = @player_1
    elsif player_2.one_pair?
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

  def high_card
    if player_1_high_card == player_2_high_card
      break_nested_flush_tie_1_deep
    elsif player_1_high_card > player_2_high_card
      @winner = @player_1
    elsif player_2_high_card > player_1_high_card
      @winner = @player_2
    end
  end

  def player_1_4_kind_height
    player_1.ranks.index(player_1.group_values[4][0])
  end

  def player_2_4_kind_height
    player_2.ranks.index(player_2.group_values[4][0])
  end

  def player_1_3_kind_height
    player_1.ranks.index(player_1.group_values[3][0])
  end

  def player_2_3_kind_height
    player_2.ranks.index(player_2.group_values[3][0])
  end

  def player_1_two_pair_highest
    player_1.ranks.index(player_1.group_values[2][-1])
  end

  def player_2_two_pair_highest
    player_2.ranks.index(player_2.group_values[2][-1])
  end

  def player_1_two_pair_next_highest
    player_1.ranks.index(player_1.group_values[2][0])
  end

  def player_2_two_pair_next_highest
    player_2.ranks.index(player_2.group_values[2][0])
  end

  def player_1_two_pair_other_card
    player_1.ranks.index(player_1.group_values[1][0])
  end

  def player_2_two_pair_other_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  def player_1_single_pair_height
    player_1.ranks.index(player_1.group_values[2][0])
  end

  def player_2_single_pair_height
    player_2.ranks.index(player_2.group_values[2][0])
  end

  def player_1_highest_single_card
    player_1.ranks.index(player_1.group_values[1][-1])
  end

  def player_2_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-1])
  end

  def player_1_next_highest_single_card
    player_1.ranks.index(player_1.group_values[1][-2])
  end

  def player_2_next_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-2])
  end

  def player_1_lowest_single_card
    player_1.ranks.index(player_1.group_values[1][0])
  end

  def player_2_lowest_single_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  def player_1_high_card
    player_1.ranks.index(player_1.cards[-1].value)
  end

  def player_2_high_card
    player_2.ranks.index(player_2.cards[-1].value)
  end

  def player_1_second_high_card
    player_1.ranks.index(player_1.cards[-2].value)
  end

  def player_2_second_high_card
    player_2.ranks.index(player_2.cards[-2].value)
  end

  def player_1_third_high_card
    player_1.ranks.index(player_1.cards[-3].value)
  end

  def player_2_third_high_card
    player_2.ranks.index(player_2.cards[-3].value)
  end

  def player_1_fourth_high_card
    player_1.ranks.index(player_1.cards[-4].value)
  end

  def player_2_fourth_high_card
    player_2.ranks.index(player_2.cards[-4].value)
  end

  def player_1_lowest_card
    player_1.ranks.index(player_1.cards[0].value)
  end

  def player_2_lowest_card
    player_2.ranks.index(player_2.cards[0].value)
  end
end
