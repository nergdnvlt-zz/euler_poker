module HandEvaluation
  def ranked_values
    values.reverse
  end

  def group_values
    values.group_by { |value| values.count(value) }
  end

  def evaluate_values_keys(key)
    group_values.keys.include?(key)
  end

  def group_values_count(key)
    group_values[key].count
  end

  def group_suits
    suits.group_by { |value| suits.count(value) }
  end

  def find_index
    @ranks.index(@cards[0].value)
  end

  def same_suit?
    suits.uniq.count == 1
  end

  def suits
    @cards.map { |card| card.suit }
  end

  def values
    @cards.map { |card| card.value }
  end

  def values_match?(start)
    values == @ranks.slice(start, 5)
  end
end
