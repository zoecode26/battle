require 'game'
require 'player'

describe Game do
  
  subject(:mittens) { Player.new("Mittens") }
  subject(:dave) { Player.new("Dave") }
  subject(:game) {Game.new(dave, mittens)}

  describe '#initialize' do
    it 'confirms player 1' do
      expect(game.player_1).to eq(dave)
    end

    it 'confirms player 2' do
      expect(game.player_2).to eq(mittens)
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(mittens).to receive(:receive_damage)
      game.attack(mittens)
    end
  end

  describe '#current_turn' do
    it 'starts with Player 1' do
      expect(game.current_turn).to eq dave
    end
  end

  describe '#switch_turn' do
    it 'switches turns' do
      game.switch_turn
      expect(game.current_turn).to eq mittens
    end
  end
end