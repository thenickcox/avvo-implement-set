require 'board_manager'
require 'card'

describe '#find_set' do
  # rubocop:disable Metrics/LineLength
  context 'set exists: cards 1, 3, and 4 (different rows) are a same-color set' do
    let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
    let(:card_2) { Card.new(color: 'green', shape: 'squiggle', shading: 'empty', number: 1) }
    let(:card_3) { Card.new(color: 'red', shape: 'oval', shading: 'empty', number: 3) }
    let(:card_4) { Card.new(color: 'red', shape: 'squiggle', shading: 'solid', number: 3) }
    let(:cards)  { [card_1, card_2, card_3, card_4] }
    it 'finds a set' do
      expect(BoardManager.new(cards).find_set).to eq([card_1, card_3, card_4])
    end
  end
  context 'no set exists' do
    let(:card_1) { Card.new(color: 'red', shape: 'diamond', shading: 'solid', number: 1) }
    let(:card_2) { Card.new(color: 'green', shape: 'squiggle', shading: 'empty', number: 1) }
    let(:card_3) { Card.new(color: 'red', shape: 'diamond', shading: 'empty', number: 3) }
    let(:card_4) { Card.new(color: 'green', shape: 'squiggle', shading: 'solid', number: 3) }
    let(:cards)  { [card_1, card_2, card_3, card_4] }
    it 'returns false' do
      expect(BoardManager.new(cards).find_set).to eq(false)
    end
  end
end
