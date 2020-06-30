class Board
  def initialize
    @position = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @available_position = @position.flatten
  end

  attr_accessor :position, :available_position

  def print_board
    puts '---------------'
    self.position.each do |el|
      el.each do |value|
        print "| #{value} |"
      end
      puts ' '
      puts '---------------'
    end
  end

end

