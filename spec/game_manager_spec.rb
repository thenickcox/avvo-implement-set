require 'game_manager'
require 'card'

describe GameManager do
  let(:total_cards)   { 81 }
  let(:initial_board) { 12 }
  describe '#initialize' do
    it 'contains Card objects' do
      expect(GameManager.new.deck.first).to be_a(Card)
    end
    it 'starts with 0 sets' do
      expect(GameManager.new.total_sets.length).to eq(0)
    end
    it 'initially deals 12 cards' do
      expect(GameManager.new.deck.length).to eq(total_cards - initial_board)
    end
  end

  describe '#play' do
    let(:game) { GameManager.new }
    let(:draw_amount) { 3 }
    it 'ends the game if there are no more cards' do
      expect(game).to receive(:end_game)
      game.play
    end
    it 'deals 3 more cards if no matches' do
      game.play
      expect(game.deal_count).to be > 1
    end
    it 'adds a found set to the total sets' do
      game.play
      expect(game.total_sets.length).to be > 1
    end
  end
end
