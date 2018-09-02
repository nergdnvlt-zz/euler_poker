require './lib/hand'
require './lib/scoring'
require './lib/winning_player'
require './lib/tie_breaker'
require './lib/player_1_cards'
require './lib/player_2_cards'

class Game
  include Scoring
  include WinningPlayer
  include TieBreaker
  include Player1Cards
  include Player2Cards

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

  # def player_1_4_kind_height
  #   player_1.ranks.index(player_1.group_values[4][0])
  # end

  def player_2_4_kind_height
    player_2.ranks.index(player_2.group_values[4][0])
  end

  # def player_1_3_kind_height
  #   player_1.ranks.index(player_1.group_values[3][0])
  # end

  def player_2_3_kind_height
    player_2.ranks.index(player_2.group_values[3][0])
  end

  # def player_1_two_pair_highest
  #   player_1.ranks.index(player_1.group_values[2][-1])
  # end

  def player_2_two_pair_highest
    player_2.ranks.index(player_2.group_values[2][-1])
  end

  # def player_1_two_pair_next_highest
  #   player_1.ranks.index(player_1.group_values[2][0])
  # end

  def player_2_two_pair_next_highest
    player_2.ranks.index(player_2.group_values[2][0])
  end

  # def player_1_two_pair_other_card
  #   player_1.ranks.index(player_1.group_values[1][0])
  # end

  def player_2_two_pair_other_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  # def player_1_single_pair_height
  #   player_1.ranks.index(player_1.group_values[2][0])
  # end

  def player_2_single_pair_height
    player_2.ranks.index(player_2.group_values[2][0])
  end

  # def player_1_highest_single_card
  #   player_1.ranks.index(player_1.group_values[1][-1])
  # end

  def player_2_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-1])
  end

  # def player_1_next_highest_single_card
  #   player_1.ranks.index(player_1.group_values[1][-2])
  # end

  def player_2_next_highest_single_card
    player_2.ranks.index(player_2.group_values[1][-2])
  end

  # def player_1_lowest_single_card
  #   player_1.ranks.index(player_1.group_values[1][0])
  # end

  def player_2_lowest_single_card
    player_2.ranks.index(player_2.group_values[1][0])
  end

  # def player_1_high_card
  #   player_1.ranks.index(player_1.cards[-1].value)
  # end

  def player_2_high_card
    player_2.ranks.index(player_2.cards[-1].value)
  end

  # def player_1_second_high_card
  #   player_1.ranks.index(player_1.cards[-2].value)
  # end

  def player_2_second_high_card
    player_2.ranks.index(player_2.cards[-2].value)
  end

  # def player_1_third_high_card
  #   player_1.ranks.index(player_1.cards[-3].value)
  # end

  def player_2_third_high_card
    player_2.ranks.index(player_2.cards[-3].value)
  end

  # def player_1_fourth_high_card
  #   player_1.ranks.index(player_1.cards[-4].value)
  # end

  def player_2_fourth_high_card
    player_2.ranks.index(player_2.cards[-4].value)
  end

  # def player_1_lowest_card
  #   player_1.ranks.index(player_1.cards[0].value)
  # end

  def player_2_lowest_card
    player_2.ranks.index(player_2.cards[0].value)
  end
end
