require_relative 'player.rb'
require_relative 'treasure_trove.rb'

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
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.to_s).to eq("I'm Moe with health = 100, and score = 200.")
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

  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(50)

    @player.found_treasure(Treasure.new(:crowbar, 400))

    expect(@player.points).to eq(450)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(500)
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.score).to eq(200)
  end

end
