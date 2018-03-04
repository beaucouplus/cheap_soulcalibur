class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :bonus_damage
      t.integer :weight

      t.timestamps
    end
  end
end
