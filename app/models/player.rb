# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  player_name   :string
#  life_points   :integer
#  attack_points :integer
#  images        :string
#  experience    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Player < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_with AttachmentPresenceValidator, attributes: :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  validates :player_name, presence: true, length: { maximum: 60 }, uniqueness: true
  validates :life_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :attack_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
end