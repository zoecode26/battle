require 'game'
require 'player'

describe Game do

  let(:player_1) { Player.new("Dave") }
  let(:player_2) { Player.new("Mittens") }
  let(:game) {Game.new(player_1, player_2)}



  describe '#initialize' do
    it 'confirms player 1' do
      expect(game.players[0].name).to eq("Dave")
    end

    it 'confirms player 2' do
      expect(game.players[1].name).to eq("Mittens")
    end
  end

  describe '#attack' do
    it 'allows player 1 to receive damage' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end

    it 'allows player 2 to receive damage' do
      expect(player_1).to receive(:receive_damage)
      game.attack(player_1)
    end
  end

  describe '#current_turn' do
    it 'starts with Player 1' do
      expect(game.turn).to eq player_1
    end

    it 'starts opponent turn at player 2' do
      expect(game.opponent_turn).to eq player_2
    end
  end

  describe '#switch_turn' do
    it 'switches turns' do
      game.switch_turn
      expect(game.turn).to eq player_2
    end

    it 'sets opponent turn at player 1 after switch turn' do
      game.switch_turn
      expect(game.opponent_turn).to eq player_1
    end
  end

  describe '#game_over' do
    it 'returns true if either player has 0 points' do
      6.times{ game.attack(player_2) }
      expect(game.game_over?).to eq true
    end

    it 'returns false if both players have some points' do
      3.times{ game.attack(player_2) }
      expect(game.game_over?).to eq false
    end
  end
end
