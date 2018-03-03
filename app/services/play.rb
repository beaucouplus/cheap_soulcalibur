class Play

  attr_accessor :game, :player, :opponent
  def initialize(game,player)
    @game = game
    @player = player
    @opponent = player.opponent
  end

  def hit_opponent
    update_opponent_life
    update_game_summary
    send_infos
  end

  private

  def send_infos # mauvaise appellation ?
    defeated? ? set_winner : hit_message
  end


  def update_opponent_life
    game.change_life(player.opponent_life,new_opponent_life)
  end

  def update_game_summary
    current_action = hit_message
    game.add_to_summary(current_action)
  end

  def hit_message
    "#{opponent.player_name} lost #{damage} life points and only has #{current_opponent_life} life left !"
  end

  def damage
    player.himself.attack_points
  end

  def current_opponent_life
    game.status[player.opponent_life]
  end

  def new_opponent_life
    current_opponent_life - damage
  end

  def set_winner
    @game.set_winner(player)
  end

  def defeated?
    new_opponent_life <= 0
  end

end
