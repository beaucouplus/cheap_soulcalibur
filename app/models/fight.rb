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


  validates :player_1, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :player_2, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def loser
    Player.find(lost)
  end

  def lost
    winner.id == player_1 ? player_2 : player_1
  end

end
