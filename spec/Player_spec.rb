require "Player"

describe Player do

  describe "#initialize" do

    it "should raise error if given invalid starting cash" do
      expect{player = Player.new(-1)}.to raise_error
    end
  end

end