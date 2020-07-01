class Board
  def initialize
    @position = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @available_position = @position.flatten
  end
  attr_accessor :position, :available_position
  def print_board
    string_board = "-----------------\n"
    position.each do |el|
      el.each do |value|
        string_board += "| #{value} | "
      end
      string_board += "\n-----------------\n"
    end
    string_board
  end

  def check_winner(move, symbol)
    winner = []
    # check the row
    winner.push(position[move[0]].all? { |el| el == symbol })
    # check the column
    winner.push(position.all? { |el| el[move[1]] == symbol })
    # check the first diagonal
    if move[0] == move[1]
      winner_d = true
      3.times do |counter|
        winner_d = false unless position[counter][counter] == symbol
      end
      winner.push(winner_d)
    end
    # check the second diagonal
    if move[0] + move[1] == 2
      winner_d = true
      3.times do |counter|
        winner_d = false unless position[2 - counter][counter] == symbol
      end
      winner.push(winner_d)
    end
    winner.any? { |el| el == true }
  end
end
