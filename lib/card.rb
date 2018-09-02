class Card
  attr_reader :value, :suit, :card

  def initialize(card_value)
    @value = card_value.split('')[0]
    @suit = card_value.split('')[1]
    @card = card_value
  end
end
