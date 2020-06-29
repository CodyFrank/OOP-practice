require "pry"

class Universe

    attr_accessor :players, :size

    def self.common_universe
        @@common_universe ||= Universe.new
        return @@common_universe
    end

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

    def initialize(name, universe = Universe.common_universe)
        @name, @universe = name, universe
        @universe.add_player(self)
    end

    def walk(dir)
        raise ArgumentError.new("dir must be :right of :left") if dir != :right && dir != :left

        if dir == :right
            if self.loc >= @universe.size - 1
                puts "you cant go farther that way"
            else 
                increment_loc
            end
        else
            if self.loc <= 0 
                puts "you cant go farther that way"
            else 
                decrement_loc
            end
        end
    end

    def loc
        @universe.players[self]
    end

    private

    def increment_loc
        @universe.players[self] += 1
    end

    def decrement_loc
        @universe.players[self] -=1
    end

end

class Warrior < Human
end

class Wizard < Human
end











u = Universe.common_universe
h = Human.new("Cody")
w = Warrior.new("Arthur")
wiz = Wizard.new("Merlin")


binding.pry