class Card
    attr_reader :suit, :value, :rank

    def initialize(suit, value, rank)
        # require 'pry';binding.pry
        @suit = suit
        @value = value
        @rank = rank
    end
end
