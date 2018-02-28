class RemoveProfilePicFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :profile_pic, :string
  end
end
