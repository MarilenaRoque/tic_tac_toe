require '../lib/board.rb'
require '../lib/player.rb'


describe Board do
    before(:all) do
      @table = Board.new
    end

    describe "#initialize" do
      before(:all) do
        @table = Board.new
      end
      it "testing the position attribute for a new object" do 
        expect(@table.position).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
      end
      it "testing the available_position attribute for a new object" do 
        expect(@table.available_position).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      end
    end

    describe "#print_board" do
      # before(:all) do
      #   @table = Board.new
      # end
      it "test the new string format for the print board method" do
        expectation="-----------------\n"+ "| 1 | " + "| 2 | "+ "| 3 | "+ "\n-----------------\n"+ "| 4 | "+ "| 5 | "+ "| 6 | "+  "\n-----------------\n"+"| 7 | "+"| 8 | "+"| 9 | "+ "\n-----------------\n"
        expect(@table.print_board).to eq(expectation)        
      end
    end

    describe "#replace_symbol" do
      before(:all) do
        @table = Board.new
        @example_player= Player.new("jorge", "X")
      end
      it "test if the replace return the right move" do
        expect(@table.replace_symbol( 5, @example_player)).to eq([1,1])        
      end
      it "test if the right position was replaced" do
        @table.replace_symbol( 5, @example_player)
        expect(@table.position[1][1]).to_not eq(5)        
      end
      it "test if the right symbol was replaced" do
        @table.replace_symbol( 5, @example_player)
        expect(@table.position[1][1]).to eq("X")        
      end
    end



    describe "#remove_position" do      
      it "test if a element in a position is removed" do
        @table.remove_position(9)
        expect(@table.available_position.length).to_not eq(9)        
      end

      it "test if the right position is deleted" do
        @table.remove_position(9)
        expect(@table.available_position).to eq([1,2,3,4,5,6,7,8])        
      end
    end

end

