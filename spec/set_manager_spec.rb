require 'card'
require 'set_manager'

describe SetManager do

  describe '#is_set' do
    subject { described_class.new([card_1, card_2, card_3]).is_set? }
    context 'set based on similarity' do
      context 'all same color, but other attrs mixed' do
        let(:color)  { 'red' }
        let(:card_1) { Card.new(color: color, shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: color, shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: color, shape: 'squiggle', shading: 'solid', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all same shape, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all same shading, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'solid', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all same number, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'oval', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
    end
    context 'set based on difference' do
      context 'all different colors, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'green', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'purple', shape: 'squiggle', shading: 'solid', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all different shapes, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'squiggle', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'solid', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all different shading, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'striped', number: 2) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
      context 'all different numbers, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'oval', shading: 'empty', number: 2) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 3) }
        it 'returns true' do
          expect(subject).to eq(true)
        end
      end
    end
    context 'not a set' do
      context 'each attr has two of one attribute and one of another' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'green', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'green', shape: 'squiggle', shading: 'solid', number: 2) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
      context 'all different shapes, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'solid', number: 2) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
      context 'all different shading, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'diamond', shading: 'empty', number: 1) }
        let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'empty', number: 2) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
      context 'all different numbers, but other attrs mixed' do
        let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
        let(:card_2) { Card.new(color: 'purple', shape: 'oval', shading: 'empty', number: 3) }
        let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 3) }
        it 'returns false' do
          expect(subject).to eq(false)
        end
      end
    end
  end
end
