require 'set_formatter'
require 'card'

describe SetFormatter do
  describe '#format' do
    let(:set) do
      [
        Card.new(shape: 'diamond', number: 3, color: 'red', shading: 'striped'),
        # rubocop:disable Metrics/LineLength
        Card.new(shape: 'squiggle', number: 2, color: 'purple', shading: 'striped'),
        Card.new(shape: 'oval', number: 1, color: 'green', shading: 'striped')
      ]
    end
    subject { described_class.new(set).format }
    it 'pretty prints a set to stdout' do
      expect { subject }.to output(/shape: diamond/i).to_stdout
    end
  end
end
