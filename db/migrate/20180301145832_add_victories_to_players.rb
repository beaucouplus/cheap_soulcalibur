class AddVictoriesToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :victories, :integer, :default => 0
    add_column :players, :defeats, :integer, :default => 0
  end
end
