class Game

  attr_accessor :fight, :status
  def initialize(fight,status)
    @fight = fight
    @status = status
  end

  def change_life(player,life)
    @status[player] = life
  end

  def add_to_summary(current_action)
    @status["summary"] << current_action
  end

  def finished?
    @status["first_player_life"] == 0 || @status["second_player_life"] == 0
  end

  def set_winner(player)
    @status["winner"] = player
  end

end
