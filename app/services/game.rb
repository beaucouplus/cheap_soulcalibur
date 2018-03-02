class Game

  attr_accessor :fight, :current_player
  def initialize(fight,current_player)
    @fight = fight
    @current_player = define_current_player(current_player)
  end

  def hit_opponent
    if current_player == @fight.first_player
      "Salut #{@fight.second_player.player_name}"
    else
      "Salut #{@fight.first_player.player_name}"
    end
  end


  private

  def define_current_player(current_player)
    if current_player == "1"
      @fight.first_player
    else
      @fight.second_player
    end
  end

  def Randomize(max)
    prng = Random.new
    prng.rand(max)
  end
end
