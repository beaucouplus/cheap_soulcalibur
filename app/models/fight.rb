# == Schema Information
#
# Table name: fights
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_1   :integer
#  player_2   :integer
#

class Fight < ApplicationRecord
  belongs_to :first_player, foreign_key: 'player_1', class_name: 'Player'
  belongs_to :second_player, foreign_key: 'player_2', class_name: 'Player'



  validates :player_1, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :player_2, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
