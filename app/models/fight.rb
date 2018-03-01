class Fight < ApplicationRecord
  has_many :fightings
  has_many :players, through: :fightings
end
