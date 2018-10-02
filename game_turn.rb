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
  end
end
