class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|

      t.timestamps
    end
  end
end
