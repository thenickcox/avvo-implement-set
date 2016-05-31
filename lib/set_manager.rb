# The SetManager takes an array of cards
# and decides whether or not they are a set.
class SetManager
  def initialize(cards)
    @cards = cards
  end

  def set?
    attrs = %i(color shape shading number).collect do |attr|
      @cards.collect { |card| card.send(attr) }.uniq.length
    end
    return false if attrs.uniq.include?(2)
    true
  end
end
