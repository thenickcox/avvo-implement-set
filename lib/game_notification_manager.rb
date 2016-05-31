require_relative 'set_formatter'

# GameNotificationManager prints information about the game
# to the user: the number of sets and the cards of which
# they were comprised.
class GameNotificationManager
  def initialize(total_sets)
    @total_sets = total_sets
  end

  def end_game
    puts "Game over!\n"
    puts "Number of sets: #{@total_sets.count}\n"
    print_sets
  end

  private

  def print_sets
    @total_sets.each_with_index do |set, i|
      puts "Set #{i + 1}\n"
      ::SetFormatter.new(set).format
      puts "\n"
    end
  end
end
