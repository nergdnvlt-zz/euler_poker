module WinningPlayer
  def royal_flush
    if player_1.royal_flush? && player_2.royal_flush?
      @winner = 'tie'
    elsif player_1.royal_flush?
      @winner = @player_1
    elsif player_2.royal_flush?
      @winner = @player_2
    end
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

  def four_of_a_kind
    if player_1.four_of_a_kind? && player_2.four_of_a_kind?
      break_four_of_a_kind_tie
    elsif player_1.four_of_a_kind?
      @winner = @player_1
    elsif player_2.four_of_a_kind?
      @winner = @player_2
    end
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

  def flush
    if player_1.flush? && player_2.flush?
      break_flush_tie
    elsif player_1.flush?
      @winner = @player_1
    elsif player_2.flush?
      @winner = @player_2
    end
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

  def three_of_a_kind
    if player_1.three_of_a_kind? && player_2.three_of_a_kind?
      break_three_of_a_kind_tie
    elsif player_1.three_of_a_kind?
      @winner = @player_1
    elsif player_2.three_of_a_kind?
      @winner = @player_2
    end
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

  def one_pair
    if player_1.one_pair? && player_2.one_pair?
      break_pair_tie
    elsif player_1.one_pair?
      @winner = @player_1
    elsif player_2.one_pair?
      @winner = @player_2
    end
  end
end
