require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'
require_relative 'loaded_die'

module FightClub
  module GameTurn

    def self.take_turn(player)
      die = Die.new
      case die.roll
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
end
