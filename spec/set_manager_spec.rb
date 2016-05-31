require 'card'
require 'set_manager'

describe SetManager do
  describe '#set?' do
    subject { described_class.new([card_1, card_2, card_3]).set? }

    # rubocop:disable Metrics/LineLength
    context 'set' do
      context 'three of each attribute' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'green', shape: 'oval', shading: 'empty', number: 2) }
        let(:card_3) { Card.new(color: 'purple', shape: 'squiggle', shading: 'striped', number: 3) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'one of one attribute (color); three of other attributes' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'red', shape: 'oval', shading: 'empty', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'squiggle', shading: 'striped', number: 3) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'one of two attributes (color, shape), three of other attributes' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'red', shape: 'diamond', shading: 'empty', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'striped', number: 3) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'one of three attributes (color, shape, shading), three different numbers' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 3) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
    end

    context 'not a set (any attribute has two the same)' do
      context 'each card has two of one attribute and one of another' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'green', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'green', shape: 'squiggle', shading: 'solid', number: 2) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
      context 'two colors, three shadings, numbers, and shapes' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'solid', number: 2) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
      context 'one color and shading, three numbers, but two shapes' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'squiggle', shading: 'solid', number: 3) }
        it 'returns true' do
          expect(subject).to eq(false)
        end
      end
      context 'one color, one shape, three numbers, but two shadings' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'red', shape: 'diamond', shading: 'empty', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 3) }
        it 'returns true' do
          expect(subject).to eq(false)
        end
      end
    end
  end
end
