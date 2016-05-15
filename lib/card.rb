# The Card class represents the cards in the SET
# game with four orthogonal attributes: color,
# shape, shading, and number.
class Card
  attr_accessor :color, :shape, :shading, :number

  def initialize(opts)
    @color = opts[:color]
    @shape = opts[:shape]
    @shading = opts[:shading]
    @number = opts[:number]
  end
end
