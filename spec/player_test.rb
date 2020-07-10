require '../lib/player.rb'

describe Player do
  before(:all) do
    @player = Player.new('jorge', 'X')
  end
  describe 'initialize' do
    it 'Testing if right name is assigned' do
      expect(@player.name).to eq('jorge')
    end
    it 'Testing if right symbol is assigned' do
      expect(@player.symbol).to eq('X')
    end
  end
end
