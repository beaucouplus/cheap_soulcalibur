class CurrentPlayer

  attr_reader :player, :fight
  def initialize(fight,player)
    @fight = fight
    @player = player
  end

  def himself
    player == "1" ? fight.first_player : fight.second_player
  end

  def opponent
    himself == fight.first_player ? fight.second_player : fight.first_player
  end

  def opponent_life
    himself == fight.first_player ? "second_player_life" : "first_player_life"
  end

  def self_life
    himself == fight.first_player ? "first_player_life" : "second_player_life"
  end

end
