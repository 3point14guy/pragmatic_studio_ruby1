module FightClub
  module Playable

    def strong?
      self.health > 100
    end

    def blam
      self.health -= 10
      # do not need "self.name" here bc the Player class already has a readable attribute called name.
      puts "#{name} got blammed!"
    end

    def w00t
      self.health += 15
      puts "#{name} got w00ted!"
    end

  end
end
