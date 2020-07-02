class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
  attr_reader :name
  attr_reader :symbol
end

@available_symbols = ['X', 'O', '#', '*']
