class CreateFeaturings < ActiveRecord::Migration[5.1]
  def change
    create_table :featurings do |t|
      t.references :feature, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
