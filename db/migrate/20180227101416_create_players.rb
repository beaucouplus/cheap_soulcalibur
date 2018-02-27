class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :life_points
      t.integer :attack_points
      t.string :profile_pic
      t.integer :experience

      t.timestamps
    end
  end
end
