class Board
  def initialize
    @position = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @available_position = @position.flatten
  end

  attr_accessor :position, :available_position

  def print_board
    string_board= "-----------------\n"
    self.position.each do |el|
      el.each do |value|
        string_board=  string_board + "| #{value} | "
      end
      string_board=string_board+"\n-----------------\n"
    end
    string_board
  end

end

