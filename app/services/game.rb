class Game

  attr_accessor :status
  attr_reader :fight, :player

  def initialize(fight,status,player)
    @fight = fight
    @status = status
    @player = player
  end

  def play
    new_life = Damage.new(current_player_attack,status[current_opponent_life]).make
    update_opponent_life(new_life)
    finished? ? end_game : add_damage_to_summary
    status
  end

  private

  def update_opponent_life(new_life)
    status[current_opponent_life] = new_life
  end

  def finished?
    status[current_opponent_life] <= 0
  end

  def add_winner
    status["winner"] = current_player.id
  end

  def end_game
    add_ko_to_summary
    add_winner
  end


  def current_player_attack
    player == "first_player" ? fight.first_player.attack_points : fight.second_player.attack_points
  end

  def current_opponent
    player == "first_player" ? fight.second_player : fight.first_player
  end

  def current_player
    player == "first_player" ? fight.first_player : fight.second_player
  end

  def current_opponent_life
    player == "first_player" ? "second_player_life" : "first_player_life"
  end

  def damage_message
    "#{current_opponent.player_name} lost #{current_player_attack} life points and only has #{status[current_opponent_life]} life left !"
  end

  def add_damage_to_summary
    status["summary"] << damage_message
  end

  def ko_message
    "#{current_opponent.player_name} is KO! #{current_player.player_name} wins!"
  end

  def add_ko_to_summary
    status["summary"] << ko_message
  end

end
