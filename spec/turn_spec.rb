require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess to a card\'s question' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.string).to eq("Juneau")
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    describe '#guess' do
        it 'returns a guess' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
            
            expect(turn.guess).to eq("Juneau")
        end
    end

    describe '#card' do
        it 'returns the current card' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.card).to eq(card)
        end
    end

    describe '#correct?' do
        it 'returns true if the guess matching the answer of the card' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?).to eq(true)
        end

        it 'returns false if the guess not matching the answer of the card' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.correct?).to eq(false)
        end
    end

    describe '#feedback' do
        it 'returns a positive message if the guess is correct' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?).to eq(true)
            expect(turn.feedback).to eq('Correct!')
        end

        it 'returns a negative message if the guess is incorrect' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.correct?).to eq(false)
            expect(turn.feedback).to eq('Incorrect.')
        end
    end
end
