require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  setup do
    @player = Player.create(player_name: "Mitsurugi", life_points: 100, attack_points: 100, profile_pic: "test/fixtures/files/mitsurugi.jpg",experience: 0)
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

  test "player_name should be unique" do
    player_1 = Player.create(player_name: "Mitsurugi", life_points: 100, attack_points: 100, profile_pic: "test/fixtures/files/mitsurugi.jpg",experience: 0)
    @player.player_name = "Mitsurugi"
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

  test "player should be invalid without profile pic" do
    @player.profile_pic = nil
    refute @player.valid?
  end

  test "player should be invalid with out of range experience" do
    @player.experience = -30
    refute @player.valid?
  end

  # test de paperclip ?

end
