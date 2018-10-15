require_relative 'auditable'

module FightClub
  class LoadedDie
    include Auditable
    attr_reader :number

    def roll
      numbers = [1,1,2,5,6,6]
      @number = numbers.sample
      audit
      puts "here"
      return @number
    end

  end
end
