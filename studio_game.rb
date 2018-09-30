class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name, @health = name.capitalize, health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
# puts player1.say_hello
# puts player2.say_hello
# puts player3.say_hello

puts player2.name
player2.name = "Lawrence"
puts player2.name
puts player2.health
puts player2.score
puts player2
