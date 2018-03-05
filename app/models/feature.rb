class Feature < ApplicationRecord
  has_many :featuring
  has_many :players, through: :featuring
end
