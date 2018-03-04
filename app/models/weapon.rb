# == Schema Information
#
# Table name: weapons
#
#  id           :integer          not null, primary key
#  name         :string
#  bonus_damage :integer
#  weight       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Weapon < ApplicationRecord
  validates :name, presence: true, length: { maximum: 60 }, uniqueness: true
  validates :bonus_damage, presence: true, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 30 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }
end
