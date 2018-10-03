require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }

    puts "#{@title}s Statistics:"
    puts "#{strong.length} strong players:"
    strong.each do |player|
      puts "\n#{player.name} (#{player.health})"
    end

    puts "#{wimpy.length} wimpy players:"
    wimpy.each do |player|
      puts "\n#{player.name} (#{player.health})"
    end

    puts "\n#{@title}s High Scores"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, ".")
      puts "#{formatted_name} #{player.score}"
    end
  end

  def play(rounds)
    puts "There are #{@players.length} players in the game"
    puts @players
    1.upto(rounds) do
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end

if __FILE__ == $0

end
