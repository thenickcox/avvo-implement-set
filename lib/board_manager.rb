require_relative 'set_manager'

# BoardManager is responsible for finding sets in a board
# (a subset of the deck on the table)
class BoardManager
  def initialize(cards)
    @cards = cards
  end

  def find_set
    set = nil
    @cards.combination(3).to_a.each do |group_of_three|
      set = group_of_three if ::SetManager.new(group_of_three).set?
    end
    set || false
  end
end
