require 'ostruct'
require 'game_notification_manager'

describe GameNotificationManager do
  describe '#end_game' do
    let(:total_sets) { [[OpenStruct.new]] }
    let(:manager) { described_class.new(total_sets) }

    it 'prints the game over message' do
      expect { manager.end_game }.to output(/(game over)/i).to_stdout
    end

    it 'prints the number of sets' do
      expect { manager.end_game }.to output(/sets.*1$/).to_stdout
    end

    it 'calls #print_sets' do
      expect(manager).to receive(:print_sets)
      manager.end_game
    end
  end
end
