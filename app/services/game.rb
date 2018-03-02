class Game

  @@count = 0
  attr_accessor :fight, :players_life
  def initialize(fight,players_life)
    @fight = fight
    @players_life = players_life
    @@count += 1
  end

  def change_life(player,life)
    @players_life[player] = life
  end

  def self.rounds
    @@count
  end

  def started?
    @@count > 0
  end

end
