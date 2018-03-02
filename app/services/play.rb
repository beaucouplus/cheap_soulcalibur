class Play

  attr_accessor :game, :player, :opponent
  def initialize(game,player)
    @game = game
    @player = player
    @opponent = player.opponent
  end

  def hit_opponent
    damage = attack
    game.change_life(player.opponent_life,damage)
    "#{opponent.player_name} lost #{lost_life} life points :("
  end

  private

  def lost_life
    player.opponent.life_points - opponent_life
  end

  def attack
    opponent_life - player.himself.attack_points
  end

  def opponent_life
    game.players_life[player.opponent_life]
  end


end
