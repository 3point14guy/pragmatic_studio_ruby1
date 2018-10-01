require_relative 'player'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in the game"
    puts @players
    @players.each do |player|
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end
end

if __FILE__ == $0

end
