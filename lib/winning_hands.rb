module WinningHands
  def royal_flush?
    values_match?(8) && same_suit?
  end

  def straight_flush?
    values_match?(find_index) && same_suit?
  end

  def four_of_a_kind?
    group_values.keys.include?(4)
  end

  def full_house?
    group_values.keys.include?(3) && group_values.keys.include?(2)
  end

  def flush?
    same_suit?
  end

  def straight?
    values_match?(find_index)
  end

  def three_of_a_kind?
    evaluate_values_keys(3)
  end

  def two_pair?
    evaluate_values_keys(2) && group_values_count(2) == 4
  end

  def one_pair?
    evaluate_values_keys(2) && group_values_count(2) == 2
  end
end
