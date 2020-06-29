require "pry"

class Universe
    def initialize(players = [])
        @players = players
        @size = 100
    end
end


class Human 
    def initialize(name)
        @name = name
    end
end

class Warrior < Human
end

class Wizard < Human
end












h = Human.new("Cody")
w = Warrior.new("Arthur")
wiz = Wizard.new("Merlin")


binding.pry