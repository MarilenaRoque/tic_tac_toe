class Board
  def initialize
    @position = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @available_position = @position.flatten
  end
  attr_reader :position, :available_position
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

  def replace_symbol(current_position, current_player)
    move = 0
    position.each_with_index do |el, index1|
      el.each_with_index do |value, index2|
        if value == current_position
          el[index2] = current_player.symbol
          move = [index1, index2]
        end
      end
    end
    move
  end

  def remove_position(current_position)
    available_position.each_with_index do |el, index|
      available_position.delete_at(index) if el == current_position
    end
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
