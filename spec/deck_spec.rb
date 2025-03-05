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

            expect(deck.count).to eq(3)
        end
    end

    describe '#cards_in_category' do
        it 'filters cards by a given category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            cards_with_target_category = deck.cards_in_category(:STEM)

            expect(cards_with_target_category).to eq([card_2, card_3])
        end
        
        it 'filters cards by an other category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            cards_with_target_category = deck.cards_in_category(:Geography)

            expect(cards_with_target_category).to eq([card_1])
        end
        
        it 'filters no cards if no category found' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])

            expect(deck.cards).to eq([card_1, card_2, card_3])

            cards_with_target_category = deck.cards_in_category("Pop Culture")

            expect(cards_with_target_category).to eq([])
        end       
    end
end