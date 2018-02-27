# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  player_name   :string
#  life_points   :integer
#  attack_points :integer
#  profile_pic   :string
#  experience    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Player < ApplicationRecord

  validates :player_name, presence: true, length: { maximum: 60 }, uniqueness: true
  validates :life_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :attack_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :profile_pic, presence: true, length: { maximum: 255 }
end
