class Game
  attr_reader :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current = @players[0]
  end

  def attack(player)
    player.receive_damage
    switch_turn
  end

  def switch_turn
    @current = opponent_turn
  end

  def turn
    @current
  end

  def opponent_turn
    @players[((@players.index(@current)-1)**2)]
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end
end
