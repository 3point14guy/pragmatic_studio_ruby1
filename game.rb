require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def total_points
    @players.reduce(0) {|sum, player| sum + player.points}
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }

    puts "#{@title}s Statistics:"
    puts "#{strong.length} strong players:"
    strong.each do |player|
      puts "\n#{player.name}'s health: (#{player.health})"
      puts "#{player.name}'s points: (#{player.points})"
    end

    puts "#{wimpy.length} wimpy players:"
    wimpy.each do |player|
      puts "\n#{player.name}'s health: (#{player.health})"
      puts "#{player.name}'s points: (#{player.points})"
    end


    puts "\n#{@title}s High Scores"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, ".")
      puts "#{formatted_name} #{player.score}"
    end
    puts "\nTotal points of all treasures found = #{self.total_points}"
  end

  def play(rounds)
    puts "There are #{@players.length} players in the game:"
    puts @players

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.length} Treasures available in this game:"

    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end
    puts "\n"
    i = 1
    1.upto(rounds) do
      puts "\nRound #{i}:"
      i += 1
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end

if __FILE__ == $0

end
