
class Card
  SUITS = %w(c d h s)
  attr_reader :suit, :number
  def initialize(suit, number)
    raise ArgumentError.new "Invalid card suit" if !SUITS.include?(suit.downcase)
    raise ArgumentError.new "Invalid card number" if number < 1 || number > 13
    @suit = suit.downcase
    @number = number
  end

end