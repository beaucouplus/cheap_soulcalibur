# == Schema Information
#
# Table name: fights
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_1   :integer
#  player_2   :integer
#  winner     :integer
#  summary    :text
#  weapon_1   :integer
#  weapon_2   :integer
#

require 'test_helper'

class FightTest < ActiveSupport::TestCase
  setup do
    @mitsurugi = players(:first_player)
    @rock = players(:second_player)
    @weapon = weapons(:weapon_1)
    @fight = Fight.new(player_1: @mitsurugi.id, player_2: @rock.id, winner: @mitsurugi, weapon_1: @weapon.id, weapon_2: @weapon.id, summary: "kikou")
  end

  test "empty fight should be invalid" do
    fight = Fight.new
    refute fight.valid?
  end

  test "fight with all parameters should be valid" do
    assert @fight.valid?
  end

  test "fight without player_1 should be invalid" do
    @fight.player_1 = nil
    refute @fight.valid?
  end

  test "fight without player_2 should be invalid" do
    @fight.player_2 = nil
    refute @fight.valid?
  end

  test "summary value should be optional" do
    @fight.summary = nil
    assert @fight.valid?
  end

  test "should not be able to choose the same player twice" do
    @fight.player_1 = @rock
    @fight.player_2 = @rock
    refute @fight.valid?
  end

  test "fight without weapon should be invalid" do
    @fight.weapon_1 = nil
    refute @fight.valid?
  end

end
