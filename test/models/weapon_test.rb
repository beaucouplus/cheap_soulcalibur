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

require 'test_helper'

class WeaponTest < ActiveSupport::TestCase
  setup do
    @weapon = Weapon.create(name: "spade", bonus_damage: 10, weight: 10)
  end

  test "empty weapon should be invalid" do
    weapon = Weapon.new
    refute weapon.valid?
  end

  test "weapon with all parameters should be valid" do
    assert @weapon.valid?
  end

  test "weapon without bonus_damage should be invalid" do
    @weapon.bonus_damage = nil
    refute @weapon.valid?
  end

  test "weapon bonus_damage should not be under 5 " do
    @weapon.bonus_damage = 4
    refute @weapon.valid?
  end

  test "weapon bonus_damage should not be over 30 " do
    @weapon.bonus_damage = 31
    refute @weapon.valid?
  end

  test "weapon without weight should be invalid" do
    @weapon.weight = nil
    refute @weapon.valid?
  end

  test "weapon weight should not be under 5 " do
    @weapon.weight = 4
    refute @weapon.valid?
  end

  test "weapon bonus_damage should not be over 50 " do
    @weapon.weight = 51
    refute @weapon.valid?
  end
end
