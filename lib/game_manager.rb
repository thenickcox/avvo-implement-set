require 'yaml'
require_relative 'board_manager'
require_relative 'card'
require_relative 'game_notification_manager'

# The GameManager is responsible for game play. It
# deals the hands. When the game is over, control is
# passed to the Game Notification Manager.
class GameManager
  attr_reader :total_sets, :deal_count
  attr_accessor :deck, :board

  INITIAL_BOARD_SIZE = 12
  DRAW_AMOUNT = 3

  def initialize
    card_objs = YAML.load_file(File.open('cards.yml'))
    @deck = card_objs.collect { |card_attrs| ::Card.new(card_attrs) }.shuffle!
    @board = []
    @total_sets = []
    @deal_count = 0
    deal(INITIAL_BOARD_SIZE)
  end

  def play
    if @deck.count.zero?
      return ::GameNotificationManager.new(@total_sets).end_game
    end
    found_set = BoardManager.new(@board).find_set
    found_set ? handle_found_set(found_set) : deal(DRAW_AMOUNT)
    play
  end

  private

  def handle_found_set(set)
    @total_sets << set
    set.each { |card| @board.delete(card) }
  end

  def deal(num_cards)
    @deal_count += 1
    @deck.first(num_cards).each do |card|
      @board << card
      @deck.delete(card)
    end
  end
end
