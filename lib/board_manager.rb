require 'game_manager'

class BoardManager

  def initialize(cards)
    @cards = cards
  end

  def find_set
    set = nil
    @cards.combination(3).to_a.each do |group_of_three|
      set = group_of_three if ::GameManager.new(group_of_three).is_set?
    end
    set || false
  end

end
