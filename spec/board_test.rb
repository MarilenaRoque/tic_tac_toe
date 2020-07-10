require '../lib/board.rb'


describe Board do

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

end

