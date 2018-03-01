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
  has_many :players

  validates :player_1, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :player_2, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
