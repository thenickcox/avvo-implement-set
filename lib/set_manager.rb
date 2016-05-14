class SetManager

  def initialize(cards)
    @cards = cards
  end

  def is_set?
    set = false
    %i(color shape shading number).each do |attr|
      unique_attrs = @cards.collect { |card| card.send(attr) }.uniq.length
      set = true if unique_attrs == 1 || unique_attrs == 3
    end
    set
  end

end
