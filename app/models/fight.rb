# == Schema Information
#
# Table name: fights
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_1   :integer
#  player_2   :integer
#  winner     :integer
#  summary    :text
#  weapon_1   :integer
#  weapon_2   :integer
#

class Fight < ApplicationRecord
  belongs_to :first_player, foreign_key: 'player_1', class_name: 'Player'
  belongs_to :second_player, foreign_key: 'player_2', class_name: 'Player'

  belongs_to :first_weapon, foreign_key: 'weapon_1', class_name: 'Weapon'
  belongs_to :second_weapon, foreign_key: 'weapon_2', class_name: 'Weapon'

  belongs_to :winner, foreign_key: 'winner', class_name: 'Player', optional: true




  validates :first_player, presence: true
  validates :second_player, presence: true
  validates :first_weapon, presence: true
  validates :second_weapon, presence: true

  validates :summary, length: { maximum: 1000 }, allow_nil: true
  validate :are_not_the_same

  def are_not_the_same
    if player_1 == player_2
      errors.add(:players, 'Cannot choose the same player twice')
    end
  end


  def loser
    p lost
    Player.find(lost)
  end

  def lost
    winner.id == player_1 ? player_2 : player_1
  end



end
