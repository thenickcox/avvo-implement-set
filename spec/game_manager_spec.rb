require 'card'
require 'game_manager'

describe GameManager do

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
  end
end
