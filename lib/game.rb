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
end
