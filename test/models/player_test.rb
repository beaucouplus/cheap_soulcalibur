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

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  setup do
    @player = Player.create(player_name: "Mitsurugi", life_points: 100, attack_points: 100, image: File.new("#{Rails.root}/test/fixtures/files/mitsurugi.jpg"),experience: 0)
  end

  test "empty player should be invalid" do
    player = Player.new
    refute player.valid?
  end

  test "player should be valid with all parameters" do
    assert @player.valid?
  end

  test "player should be invalid without player_name" do
    @player.player_name = nil
    refute @player.valid?
  end

  test "player_name shouldn't be too long" do
    @player.player_name = "x" * 100
    refute @player.valid?
  end

  test "player_name should be unique" do
    player_1 = Player.create(player_name: "Voldo", life_points: 100, attack_points: 100, image: File.new("#{Rails.root}/test/fixtures/files/mitsurugi.jpg"),experience: 0)
    @player.player_name = "Voldo"
    refute @player.valid?
  end

  test "player should be invalid without life points" do
    @player.life_points = nil
    refute @player.valid?
  end

  test "player should be invalid with out of range life points" do
    @player.life_points = 130
    refute @player.valid?
  end

  test "player should be invalid without attack points" do
    @player.attack_points = nil
    refute @player.valid?
  end

  test "player should be invalid with out of range attack points" do
    @player.attack_points = 130
    refute @player.valid?
  end

  test "player should be valid without profile pic" do
    @player.image = nil
    assert @player.valid?
  end

  test "player should be invalid with out of range experience" do
    @player.experience = -1
    refute @player.valid?
  end

  test "player should be invalid with out of range victories" do
    @player.victories = -1
    refute @player.valid?
  end

  test "player should be invalid with out of range defeats" do
    @player.defeats = -1
    refute @player.valid?
  end


end
