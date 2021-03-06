require_relative 'treasure_trove'
require_relative 'playable'

module FightClub
  class Player
    include Playable
    attr_accessor :name, :health

    def initialize(name, health=100)
      @name, @health = name.capitalize, health
      @found_treasures = Hash.new(0)
    end

    def name=(new_name)
      @name = new_name.capitalize
    end

    def to_s
      "I'm #{@name} with health = #{@health}, and score = #{score}."
    end

    def self.from_csv(csv_string)
      name, health = csv_string.split(',')
      Player.new(name, Integer(health))
    end

    def <=>(other_player)
      other_player.score <=> score
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{self.name} found a #{treasure.name} worth #{treasure.points} points"
      puts "#{self.name}'s treasures: #{@found_treasures}"
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        yield Treasure.new(name, points)
      end
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def score
      @health + self.points
    end
    
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
