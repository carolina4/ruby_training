require "set"
require "card"

describe Card do
	def card(params = {})
		defaults = {
			suit: :hearts,
			rank: 7
		}

		Card.build(*defaults.merge(params).values_at(:suit, :rank))
	end

	it 'has a suit' do
		expect(card(suit: :spades).suit).to eq(:spades)
	end

	it 'has a rank' do
		expect(card(rank: 4).rank).to eq(4)
	end

	context 'equality' do
		subject { card(suit: :spades, rank: 4) }

		describe 'comparing against self' do
			let(:other) { card(suit: :spades, rank: 4) }

			it 'is equal' do
				expect(subject).to eq(other)
			end

			it 'is hash equal' do
				expect(Set.new([subject, other]).size).to eq(1)
			end
		end

		shared_examples_for 'an unequal card' do
			it 'is not equal' do
				expect(subject).to_not eq(other)
			end

			it 'is not hash equal' do
				expect(Set.new([subject, other]).size).to eq(2)
			end
		end

		describe 'comparing to a card of a different suit' do
			let(:other) { card(suit: :hearts, rank: 4) }

			it_behaves_like 'an unequal card'
		end

		describe 'comparing to a card of a different rank' do
			let(:other) { card(suit: :spades, rank: 5) }

			it_behaves_like 'an unequal card'
		end
	end

	describe 'a jack' do
		it 'ranks higher than a 10' do
			expect(card(rank: 10).rank).to be < card(rank: :jack).rank
		end
	end

	describe 'a queen' do
		it 'ranks higher than a jack' do
			expect(card(rank: :jack).rank).to be < card(rank: :queen).rank
		end
	end

	describe 'a king' do
		it 'ranks higher than a queen' do
			expect(card(rank: :queen).rank).to be < card(rank: :king).rank
		end
	end

	describe '.from_string', :aggregate_failures do
		it 'parses numbers' do
			expect(Card.from_string("7H")).to eq(Card.build(:hearts, 7))
		end

		it 'parses 10' do
			expect(Card.from_string("10S")).to eq(Card.build(:spades, 10))
		end

		it 'parses face cards' do
			expect(Card.from_string("JC")).to eq(Card.build(:clubs, :jack))
			expect(Card.from_string("QC")).to eq(Card.build(:clubs, :queen))
			expect(Card.from_string("KC")).to eq(Card.build(:clubs, :king))
		end
	end

end