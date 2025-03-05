require './lib/card'
require './lib/deck'

RSpec.describe do 
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])

        expect(deck).to be_instance_of(Deck)
    end

    it 'has several cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])

        expect(deck.cards).to eq([card_1, card_2, card_3])
    end

    describe '#count' do
        it 'returns the number of cards in the current deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards.size).to eq(3)
        end
    end

    describe '#cards_in_category' do
        it 'filters cards by a given category'
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            deck.cards_in_category(:STEM)

            expect(deck.cards).to eq([card_2, card_3])
        end
        
        it 'filters cards by an other category'
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            deck.cards_in_category(:Geography)

            expect(deck.cards).to eq([card_1])
        end
        
        it 'filters no cards if no category found'
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            deck.cards_in_category("Pop Culture")

            expect(deck.cards).to eq([])
        end       
    end
end