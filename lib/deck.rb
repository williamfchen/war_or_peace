class Deck
    attr_reader :cards
  
    def initialize(cards = [])
      @cards = cards
    end
  
    def rank_of_card_at(index)
      cards[index].rank
    end

    def high_ranking_cards
        cards.value >= 11
    end

  end