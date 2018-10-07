require_relative 'treasure_trove'

module GameTurn

  def self.roll_die
    rand(1..6)
  end

  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    case number_rolled
      when 1..2
        player.blam
      when 3..4
        puts "Nothing happened to #{player.name}."
      else
        player.w00t
    end
    treasure = TreasureTrove::TREASURES.sample

    player.found_treasure(treasure)

  end
end
