#!/usr/bin/env ruby
require "./lib/player.rb"


times = 0

def symbol_validation(player_name)
  symbol = nil
  puts "Choose #{player_name} symbol:"
  until symbol
    begin
      puts "Available symbols: #{@available_symbols}"
      symbol = gets.chomp.upcase

      raise TypeError if @available_symbols.none? { |el| el == symbol }
    rescue TypeError
      puts 'Choose an available symbol:'
      symbol = nil
    end
  end
  @available_symbols.each_with_index do |el, index|
    @available_symbols.delete_at(index) if el == symbol
  end
  symbol
end

def print_board
  puts '---------------'
  @board.each do |el|
    el.each do |value|
      print "| #{value} |"
    end
    puts ' '
    puts '---------------'
  end
end

play_again = 0
while play_again != '1'
  @available_symbols = ['X', 'O', '#', '*']
  @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  @available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  if times.zero?
    puts 'Type player 1 name:'
    player1_name = gets.chomp.to_s # it will be an attribute when the logic was ready
    player1_symbol = symbol_validation(player1_name)
    puts 'Type player 2 name:'
    player2_name = gets.chomp.to_s # it will be an attribute when the logic was ready
    player2_symbol = symbol_validation(player2_name)
  end
  current_player = player1_name
  current_symbol = player1_symbol

  until @available_moves.empty?
    print_board

    # this verification will be a outside method for the logic part

    begin
      puts " #{current_player}, choose your position:"
      current_position = gets.chomp.to_i
      raise TypeError if @available_moves.none? { |el| el == current_position }
    rescue TypeError
      system('clear')
      puts 'Choose one of the available moves:'
      puts "Available moves: #{@available_moves}"
    else
      system('clear')
      @board.each do |el|
        el.each_with_index do |value, index|
          el[index] = current_symbol if value == current_position
        end
      end

      # For the next milestone we will build a method to test if there is a winner
      # winner = is_there_a_winner?
      winner = false # this isn't work yet
      if winner

        puts "Congrats #{current_player}. You're the winner!"
        break
      end

      @available_moves.each_with_index do |el, index|
        @available_moves.delete_at(index) if el == current_position
      end

      current_player = @available_moves.length.even? ? player2_name : player1_name
      current_symbol = @available_moves.length.even? ? player2_symbol : player1_symbol
    end
  end

  puts ' It is a draw!' unless winner

  print_board
  puts 'Press 1 to quit, or any other option to a new round'
  play_again = gets.chomp.to_s
  times += 1
end
