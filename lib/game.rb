class Game
  attr_reader :player_1, :player_2, :current_turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = player_1
  end

  def attack(player)
    player.receive_damage
    switch_turn
  end

  def switch_turn
    if @current_turn == player_1
      @current_turn = player_2
    else
      @current_turn = player_1
    end
  end
end
