#!/usr/bin/env ruby
# while the user wants to play
# if it is the first time
# ask player 1 name
# ask player 2 name
# Symbol
# end

# while there is no winner or there was less than 9 moves
# print the table
# ask for the player movement
# call the function to test if there is a winner
# if there_is_a_winner?
# print table
# print player is a winner
# break the while
# end
# change the player
# end

# if !there_is_a_winner?
# print table
# print "There is a draw"
# end

# Ask user ig he want to play again
# if yes run loop again
# if no break the loop
# end

@available_symbols = ['X', 'O', '#', '*']
@board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
@available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
play_again = true
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

while play_again
  if times == 0
    puts 'Type player 1 name:'
    player1_name = gets.chomp.to_s # it will be an attribute when the logic was ready
    player1_symbol = symbol_validation(player1_name)
    puts 'Type player 2 name:'
    player2_name = gets.chomp.to_s # it will be an attribute when the logic was ready
    player2_symbol = symbol_validation(player2_name)
  end
  current_player = player1_name
  current_symbol = player1_symbol


  9.times do |counter|
    puts "I am a counter #{counter}"
    print_board

    #this verification will be a outside method for the logic part

    begin
      puts " #{current_player}, choose your position:"
      current_position = gets.chomp.to_i
      raise TypeError if  @available_moves.none? { |el| el == current_position }
    rescue TypeError
      puts 'Choose one of the available moves:'
      puts "Available moves: #{@available_moves}"
      puts 'I am here'
    else
      @board.each do |el|
        el.each_with_index do |value, index|
          el[index] = current_symbol if value == current_position
        end
      end
      current_player = !counter.odd? ? player2_name : player1_name 
      current_symbol = !counter.odd? ? player2_symbol : player1_symbol
    
      @available_moves.each_with_index do |el, index|
        @available_moves.delete_at(index) if el == current_position
      end
    end
    
  end
  print_board
  play_again = false 
end
