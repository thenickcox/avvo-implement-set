# The SetFormatter creates more human-readable
# set output for the game ending.
class SetFormatter
  def initialize(set)
    @set = set
  end

  def format
    formatted_output = []
    @set.each_with_index do |card|
      formatted_output << "Shape: #{card.shape}, Number: #{card.number} "\
        "Color: #{card.color}, Shading: #{card.shading}"
    end
    puts formatted_output.join("\n")
    puts "\n"
  end
end
