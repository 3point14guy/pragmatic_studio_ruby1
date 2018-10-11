require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("daryl", 100)
player5 = Player.new("daryl", 105)




knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
# knuckleheads.play

newhart = Game.new("Newhart")
# newhart.add_player(player2)
# newhart.add_player(player4)
# newhart.add_player(player5)
newhart.load_players(ARGV.shift || "players.csv")

loop do
  puts "How many rounds do you want to play? (type 'q' to quit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    newhart.play(answer.to_i)
  when "q"
    newhart.print_stats
    break
  else
    puts "Please enter a number or 'q' for quit."
  end
end

newhart.save_high_scores
