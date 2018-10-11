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

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, ".")
    "#{formatted_name} #{player.score}"
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end
  end
  
  #alternate using CSV library
  #require 'csv'
  # def load_players(from_file)
  #   CSV.foreach(from_file) do |row|
  #     player = Player.new(row[0], row[1].to_i)
  #     add_player(player)
  #   end
  # end

  def total_points
    @players.reduce(0) {|sum, player| sum + player.points}
  end

  def save_high_scores(file_name="high_scores.txt")
    File.open(file_name, "w") do |file|
      file.puts("#{@title}'s High Scores:")
      @players.sort.each do |player|

        file.puts high_score_entry(player)
      end
    end
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }

    puts "#{@title}s Statistics:"
    puts "#{strong.length} strong players:"
    strong.each do |player|
      puts "\n#{player.name}'s health: (#{player.health})"
    end

    puts "#{wimpy.length} wimpy players:"
    wimpy.each do |player|
      puts "\n#{player.name}'s health: (#{player.health})"
    end

    @players.each do |player|
      puts "\n#{player.name}'s points breakdown: "
      player.each_found_treasure { |treasure| puts "#{treasure.name}: #{treasure.points}" }
      puts "#{player.name}'s total points: (#{player.points})"
    end

    puts "\n#{@title}s High Scores"
    @players.sort.each do |player|
      puts high_score_entry(player)
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
