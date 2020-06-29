require "pry"

class Universe

    attr_accessor :players, :size

    def initialize
        @players = {}
        @size = 100
    end

    def add_player(player)
        raise ArgumentError.new("player must be a player object") if !player.is_a?(Human)
        taken_locs = @players.values
        r = Random.new
        new_loc = r.rand(100)
        while taken_locs.include?(new_loc)
            new_loc = r.rand(100)
        end
        @players[player] = new_loc
    end
end


class Human 

    attr_accessor :name

    def initialize(name)
        @name = name
    end

    
end

class Warrior < Human
end

class Wizard < Human
end











u = Universe.new
h = Human.new("Cody")
w = Warrior.new("Arthur")
wiz = Wizard.new("Merlin")


binding.pry