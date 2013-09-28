class Player

  attr_reader :wallet, :name, :bet

  attr_accessor :hand

  def initialize(name, starting_cash=0)
    raise ArgumentError.new "Starting cash must be valid" if starting_cash < 0 || !starting_cash.is_a?(Integer)
    @wallet = starting_cash
    @name = name
  end

  def bet=(value)
    @bet = bet
  end

  def take_bet
    @wallet -= @bet
    @bet = 0
  end

  def get_bet_response
    response = ""
    until Poker.BETTING_COMMANDS.include?(response)
      puts "It is #{@name}'s turn. What would you like to do? (fold, raise, call, withdraw(from game!))"
      response = gets.chomp.downcase
    end
    return response
  end

  def get_raise_amount(prev_bet)
    response = 0
    puts
    print "Enter raise amount: "
    response = gets.chomp.downcase.to_i

    if !response.is_a?(Integer)
      raise ArgumentError.new "That is not a number"
    elsif response > prev_bet
      raise ArgumentError.new "You must bet higher than the most recent bet."
    elsif wallet < response
      raise ArgumentError.new "You don't have that much money!"
    end

    return response
  end

# (including fold, raise, or check, withdraw from game)

end