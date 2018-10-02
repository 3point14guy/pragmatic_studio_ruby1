require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def roll_die
    rand(1..6)
  end

  def play
    puts "There are #{@players.length} players in the game"
    puts @players
    @players.each do |player|
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
      puts player
    end
  end
end

if __FILE__ == $0

end
