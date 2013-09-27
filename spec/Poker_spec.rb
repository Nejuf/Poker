require 'rspec'
require 'Poker'

describe Poker do
  subject(:game) {Poker.new}

  describe "#initialize" do

    it "Creates two or more players" do
      game.players.length.should be > 1
    end

    it "Creates a deck of 52 elements" do
      game.deck.length.should == 52 - game.players.length*5
    end

    it "Creates a deck consisting of Cards" do
      game.deck.all?{|el| el.is_a? Card}.should == true
    end

    it "Ensures players have starting cash" do
      game.players.all?{|player| player.wallet > 0}.should == true
    end

    it "Sets starting pot to 0" do
      game.pot.should == 0
    end

  end

  describe "#deal" do

    it "Deals to each player until everyone has exactly 5 cards" do
      game.deal
      expect(game.players.all?{|player| player.hand.length == 5}).to eq true
    end

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