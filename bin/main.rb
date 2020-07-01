#!/usr/bin/env ruby
require './lib/board.rb'
require './lib/player.rb'

play_again = 0
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

def move_input(name)
  system('clear')
  puts @table.print_board
  current_position = false
  while @table.available_position.none? { |el| el == current_position }
    puts 'Invalid move!' unless current_position == false
    puts "#{name}, Choose your position: #{@table.available_position}"
    current_position = gets.chomp.to_i
    @table.available_position.none? { |el| el == current_position }
  end
  current_position
end

until play_again == '1'
  @table = Board.new
  if times.zero?
    puts 'Type player 1 name:'
    player1_name = gets.chomp.to_s
    player1_symbol = symbol_validation(player1_name)
    player1 = Player.new(player1_name, player1_symbol)
    puts 'Type player 2 name:'
    player2_name = gets.chomp.to_s
    player2_symbol = symbol_validation(player2_name)
    player2 = Player.new(player2_name, player2_symbol)
  end

  current_player = player1
  move = 0
  until @table.available_position.empty?
    current_position = move_input(current_player.name)
    @table.position.each_with_index do |el, index1|
      el.each_with_index do |value, index2|
        if value == current_position
          el[index2] = current_player.symbol
          move = [index1, index2]
        end
      end
    end

    @table.available_position.each_with_index do |el, index|
      @table.available_position.delete_at(index) if el == current_position
    end
    winner = @table.check_winner(move, current_player.symbol)
    if winner
      system('clear')
      puts @table.print_board
      puts "Congrats #{current_player.name}. You're the winner!"
      break
    end

    current_player = @table.available_position.length.even? ? player2 : player1
  end

  unless winner
    system('clear')
    puts ' It is a draw!'
    puts @table.print_board
  end

  puts 'Press 1 to quit, or any other option to a new round'
  play_again = gets.chomp.to_s
  times += 1
end
