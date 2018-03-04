class AddWeaponsToFights < ActiveRecord::Migration[5.1]
  def change
    add_column :fights, :weapon_1, :integer
    add_column :fights, :weapon_2, :integer
  end
end
