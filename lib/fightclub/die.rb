require_relative 'auditable'

module FightClub
  class Die
    include Auditable

    attr_reader :number

    def roll
      @number = rand(1..6)
      audit
      return @number
    end

  end
end

if __FILE__ == $0
  die = Die.new
  die.roll
end
