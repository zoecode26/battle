require 'player'

RSpec.describe Player do
  subject(:mittens) { Player.new("Mittens") }
  subject(:dave) { Player.new("Dave") }

  describe 'name' do
    it 'returns the name' do
      expect(mittens.name).to eq 'Mittens'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(dave.hit_points).to eq Player::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it "reduces the player's HP" do
      expect { dave.receive_damage }. to change { dave.hit_points }.by(-10)
    end
  end

end
