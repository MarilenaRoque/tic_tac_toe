#!/usr/bin/env ruby
#while the user wants to play   
    #if it is the first time    
    #ask player 1 name    
    #ask player 2 name  
    #Symbol
#end

#while there is no winner or there was less than 9 moves    
    # print the table    
    # ask for the player movement    
    # call the function to test if there is a winner
    # if there_is_a_winner?
        #print table
        #print player is a winner      
        #break the while
    # end    
    # change the player  
#end

# if !there_is_a_winner?    
    # print table    
    # print "There is a draw"  
# end

# Ask user ig he want to play again  
    # if yes run loop again  
    # if no break the loop
# end

@available_symbols = [ "X", "O", "#", "*"]
@board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
play_again = true
times = 0

def symbol_validation(player_name)
#   print @available_symbols
  symbol = nil
  puts "Choose #{player_name} symbol:"
  while !symbol
    begin
      puts "Available symbols: #{@available_symbols}"
      symbol= gets.chomp.upcase

      if @available_symbols.none? { |el| el == symbol}
        raise TypeError
      end
    rescue TypeError
      puts "Choose an available symbol:"
      symbol = nil
    end
  end
  @available_symbols.each_with_index {|el,index| 
        if el==symbol 
            @available_symbols.delete_at(index) 
        end
        }  
  return symbol

end



def print_board
    puts "---------------"
    @board.each {|el|
        el.each { |value|
            print "| #{value} |"
        }
        puts " "
        puts "---------------"
    }
end

while play_again
  if times == 0
    puts "Type player 1 name:"
    player1_name = gets.chomp.to_s #it will be an attribute when the logic was ready
    player1_symbol=symbol_validation(player1_name)
    puts "Type player 2 name:"
    player2_name = gets.chomp.to_s #it will be an attribute when the logic was ready
    player2_symbol=symbol_validation(player2_name)
  end
  print_board
  play_again = false
end



