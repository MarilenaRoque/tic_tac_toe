require '../lib/board.rb'
require '../lib/player.rb'

describe Board do
  before(:all) do
    @table = Board.new
    @example_player = Player.new('jorge', 'X')
  end

  describe '#initialize' do
    it 'testing the position attribute for a new object' do
      expect(@table.position).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
    it 'testing the available_position attribute for a new object' do
      expect(@table.available_position).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#print_board' do
    it 'test the new string format for the print board method' do
      expectation = "-----------------\n"
      expectation += '| 1 | | 2 | | 3 | '
      expectation += "\n-----------------\n"
      expectation += '| 4 | | 5 | | 6 | '
      expectation += "\n-----------------\n"
      expectation += '| 7 | | 8 | | 9 | '
      expectation += "\n-----------------\n"
      expect(@table.print_board).to eq(expectation)
    end
  end

  describe '#replace_symbol' do
    it 'test if the replace return the right move' do
      expect(@table.replace_symbol(5, @example_player)).to eq([1, 1])
    end
    it 'test if the right position was replaced' do
      @table.replace_symbol(5, @example_player)
      expect(@table.position[1][1]).to_not eq(5)
    end
    it 'test if the right symbol was replaced' do
      @table.replace_symbol(5, @example_player)
      expect(@table.position[1][1]).to eq('X')
    end
  end

  describe '#remove_position' do
    it 'test if a element in a position is removed' do
      @table.remove_position(9)
      expect(@table.available_position.length).to_not eq(9)
    end

    it 'test if the right position is deleted' do
      @table.remove_position(9)
      expect(@table.available_position).to eq([1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe '#check winner' do
    it 'Check if returns false when there is no winner on the table' do
      expect(@table.check_winner([2, 0], 'X')).to_not eq(true)
    end
    it 'Check if returns true when theres a winner on the column where the last move was made' do
      @table = Board.new
      @table.replace_symbol(1, @example_player)
      @table.replace_symbol(4, @example_player)
      @table.replace_symbol(7, @example_player)
      expect(@table.check_winner([2, 0], 'X')).to eq(true)
    end
    it 'Check if returns true when theres a winner on the row where the last move was made' do
      @table = Board.new
      @table.replace_symbol(4, @example_player)
      @table.replace_symbol(5, @example_player)
      @table.replace_symbol(6, @example_player)
      expect(@table.check_winner([1, 2], 'X')).to eq(true)
    end
    it 'Check if returns true when theres a winner on the first diagonal' do
      @table = Board.new
      @table.replace_symbol(1, @example_player)
      @table.replace_symbol(5, @example_player)
      @table.replace_symbol(9, @example_player)
      expect(@table.check_winner([2, 2], 'X')).to eq(true)
    end
    it 'Check if returns true when theres a winner on the second diagonal' do
      @table = Board.new
      @table.replace_symbol(3, @example_player)
      @table.replace_symbol(5, @example_player)
      @table.replace_symbol(7, @example_player)
      expect(@table.check_winner([2, 0], 'X')).to eq(true)
    end
  end
end
