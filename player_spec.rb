require_relative 'player.rb'

describe Player do
  before do
    @health = 100
    @player = Player.new("moe", @health)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Moe")
  end

  it "has an initial health" do
    expect(@player.health).to eq(100)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Moe with a health of 100 and a score of 103.")
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(103)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@health + 15)
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    expect(@player.health).to eq(@health - 10)
  end

  context "player with a health > 100" do
    before do
      @initial_health = 150
      @player = Player.new("moe", @initial_health)
    end

    it "a strong player has a health of > 100" do
      expect(@player).to be_strong
      # is the same as
      # expect(@player.strong?).to eq(true)
    end
  end

  context "player with a health < 100" do
    before do
      @initial_health = 50
      @player = Player.new("moe", @initial_health)
    end

    it "a wimpy player has a health of < 100" do
      expect(@player.strong?).to eq(false)
      # is the same as
      # expect(@player.strong?).to eq(true)
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end
    it "is sorted by decreasing score" do
        expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
end
