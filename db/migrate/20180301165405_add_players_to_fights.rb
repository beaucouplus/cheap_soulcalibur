class AddPlayersToFights < ActiveRecord::Migration[5.1]
  def change
    add_column :fights, :player_1, :integer
    add_column :fights, :player_2, :integer
  end
end
