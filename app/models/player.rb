# == Schema Information
#
# Table name: players
#
#  id                 :integer          not null, primary key
#  player_name        :string
#  life_points        :integer
#  attack_points      :integer
#  experience         :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  victories          :integer          default(0)
#  defeats            :integer          default(0)
#

class Player < ApplicationRecord

  has_many :home_fights, foreign_key: 'player_1', class_name: 'Fight'
  has_many :away_fights, foreign_key: 'player_2', class_name: 'Fight'
  has_many :wins, foreign_key: 'winner', class_name: 'Fight'


  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  validates :player_name, presence: true, length: { maximum: 60 }, uniqueness: true
  validates :life_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :attack_points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :victories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :defeats, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
