require 'yaml'
require_relative 'board_manager'
require_relative 'card'
require_relative 'set_formatter'

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
    return end_game if @deck.length.zero?
    found_set = BoardManager.new(@board).find_set
    if found_set.is_a?(Array)
      @total_sets << found_set
      found_set.each { |card| @board.delete(card) }
      return play
    else
      deal(DRAW_AMOUNT)
      return play
    end
  end

  private

  def end_game
    puts "Game over!\n"
    puts "Number of sets: #{@total_sets.length}\n"
    puts "Sets: \n"
    @total_sets.each_with_index do |set, i|
      puts "Set #{i+1}\n"
      SetFormatter.new(set).format
    end
  end

  def deal(num_cards)
    @deal_count += 1
    @deck.first(num_cards).each do |card|
      @board << card
      @deck.delete(card)
    end
  end

end