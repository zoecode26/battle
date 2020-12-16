class Game
  attr_reader :players, :attacked

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current = @players[0]
    @attacked = false
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def attack(player)
    @attacked = true
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

  def game_over?
    return player_1.hit_points == 0 || player_2.hit_points == 0
  end
end
