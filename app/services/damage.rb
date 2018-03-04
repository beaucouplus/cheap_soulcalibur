class Damage

  attr_reader :attack, :opponent_life
  def initialize(attack, opponent_life)
    @attack = attack
    @opponent_life = opponent_life
  end

  def make
    opponent_life - attack
  end

end
