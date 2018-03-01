# == Schema Information
#
# Table name: fights
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fight < ApplicationRecord
  has_many :fightings
  has_many :players, through: :fightings

  accepts_nested_attributes_for :fightings
end
