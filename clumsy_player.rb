require_relative 'player'

class ClumsyPlayer < Player

  # def initialize(name, health)
  #   super(name, health)
  # end

# modifies the found_treasure method in the Player class
  def found_treasure(treasure)
    points = treasure.points / 2
    @found_treasures[treasure.name] += points
    puts "#{@name} found a #{treasure.name} worth #{points} points."
  end

  # to avoid duplicating code we can use super
  # make a new Treasure object that has half points for a ClumsyPlayer
  def found_treasure(treasure)
    trinket = Treasure.new(treasure.name, treasure.points / 2)
    super(trinket)
  end

end


if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")

  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)

  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)

  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end
