class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end
    
    def type
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war
        else   
            :basic
        end
    end

    def winner
        if type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else
                player2
            end
        elsif type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2
            end
        else
            "No Winner"
        end
    end

    def pile_cards
        if type == :basic and winner == player1
            spoils_of_war << player2.deck.remove_card

        elsif type == :basic and winner == player2
            spoils_of_war << player1.deck.remove_card

        elsif type == :war and winner == player1
            spoils_of_war << player2.deck.cards.slice!(0,3)

        elsif type == :war and winner == player2
            spoils_of_war << player1.deck.cards.slice!(0,3)
        
        else
            player1.deck.cards.slice!(0,3)
            player2.deck.cards.slice!(0,3)
        end
    end
  
        
end

