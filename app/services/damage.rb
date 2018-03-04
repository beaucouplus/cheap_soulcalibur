class Damage

  attr_reader :attack, :opponent_life, :bonus_damage, :weight
  def initialize(attack, weapon,opponent_life)
    @attack = attack
    @bonus_damage = weapon.bonus_damage
    @weight = weapon.weight
    @opponent_life = opponent_life
  end

  def make
    attack = total_attack
    { remaining_life: remaining_life(attack),
      total_attack: attack }
  end

  private

  def remaining_life(attack)
    opponent_life - attack
  end

  def total_attack
    attack + calculate_weapon_damage
  end

  def calculate_weapon_damage
    bonus_damage - (weight / random_number)
  end

  def random_number
    prng = Random.new
    prng.rand(1..5)
  end

end
