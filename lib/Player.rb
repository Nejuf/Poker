class Player

  attr_reader :wallet

  attr_accessor :hand

  def initialize(starting_cash=0)
    raise ArgumentError.new "Starting cash must be valid" if starting_cash < 0 || !starting_cash.is_a?(Integer)
    @wallet = starting_cash
  end
end