require_relative 'set_manager'

# BoardManager is responsible for finding sets in a board
# (a subset of the deck on the table)
class BoardManager
  CARDS_IN_SET = 3

  def initialize(cards)
    @cards = cards
  end

  def find_set
    set = nil
    @cards.combination(CARDS_IN_SET).to_a.each do |group_of_three|
      set = group_of_three if ::SetManager.new(group_of_three).set?
    end
    set || false
  end
end
