# when everything was in one directory, we used
# "require_relative 'berserk_player'""

# when you have your concerns separated, you can still use "require_relative", but you have to define the path:
# "require_relative '../../lib/fightclub/berserk_player'"
# OR....

require 'fightclub/berserk_player'

# Using require tells Ruby to look for files in something called the load path. And when we run RSpec, it automatically adds the lib and spec directories to the load path (that's one benefit of following the conventions!) So when we call require with the path studio_game/player, it finds the player.rb file beneath the lib subdirectory.

module FightClub
  describe BerserkPlayer do

    before do
      @initial_health = 50
      @player = BerserkPlayer.new("berserker", @initial_health)
    end

    it "does not go berserk when w00ted up to 5 times" do
      1.upto(5) { @player.w00t }

      expect(@player.berserk?).to be false
    end

    it "goes berserk when w00ted more than 5 times" do
      1.upto(6) { @player.w00t }

      expect(@player.berserk?).to be true
    end

    it "gets w00ted instead of blammed when it's gone berserk" do
      1.upto(6) { @player.w00t }
      1.upto(2) { @player.blam }

      expect(@player.health).to eq(@initial_health + (8 * 15))
    end

  end
end
