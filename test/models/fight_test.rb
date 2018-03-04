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
    @fight = Fight.create(player_1: 1, player_2: 2)
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

  test "player_1 value should not be under 0 " do
    @fight.player_1 = -1
    refute @fight.valid?
  end

  test "fight without player_2 should be invalid" do
    @fight.player_2 = nil
    refute @fight.valid?
  end

  test "player_2 value should not be under 0 " do
    @fight.player_2 = -1
    refute @fight.valid?
  end

  test "summary value should be optional" do
    @fight.summary = nil
    assert @fight.valid?
  end

end
