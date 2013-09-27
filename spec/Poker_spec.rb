require 'rspec'
require 'Poker'

describe Poker do

  describe "#initialize" do

    it "Creates two or more players"

    it "Creates a deck of 52 cards"

    it "Gives players starting cash"

    it "Sets starting pot to 0"

  end

  describe "#deal" do

    it "Deals to each player until everyone has exactly five cards"

  end

  describe "#do_bets" do

    it "Does not change the number of cards in the players' hands"

    it "Loops until all players have decided not to raise"

  end

  describe "#draw" do

    it "Does not let a player change more than 3 cards"

    it "Does not let a player acquire cards without discarding"

  end

  describe "#showdown" do

    it "Gives the pot to the player with the winning hand"

    it "Does not change the wallet of the other players"

  end

end