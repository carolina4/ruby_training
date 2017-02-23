require "deck"

RSpec::Matchers.define(:be_contiguous) do
    match do |array|
        !first_non_contiguous_pair(array)
    end

    failure_message do |array|
        "%s and %s were not contiguous" % first_non_contiguous_pair(array)
    end

    def first_non_contiguous_pair(array)
        array
            .sort
            .each_cons(2)
            .detect {|x,y| x + 1 != y}
    end
end

describe 'Deck' do
    describe '.all' do
        it 'contains 32 cards' do
            expect(Deck.all.length).to eq(32)
        end

        it 'has a seven as its lowest card' do
            #Deck::SUITS.each do |suit|
            #    expect(Deck.all).to     include(Card.build(suit, 7))
            #    expect(Deck.all).to_not include(Card.build(suit, 6))
            #end

            #Deck.all.each do |card|
            #    expect(card.rank). to be >= 7
            #end

            #expect(Deck.all.map {|card| card.rank }).to all(be >= 7)

            expect(Deck.all).to all(have_attributes(rank: be >= 7))
        end

        it 'has contigous ranks by suit' do
            Deck.all.group_by{|card| card.suit}.each do |suit, cards|
                expect(cards.map{|card| card.rank }).to be_contiguous
            end
        end
    end
end