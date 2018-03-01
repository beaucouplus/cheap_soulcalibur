class CreateFightings < ActiveRecord::Migration[5.1]
  def change
    create_table :fightings do |t|
      t.references :player, foreign_key: true
      t.references :fight, foreign_key: true

      t.timestamps
    end
  end
end
