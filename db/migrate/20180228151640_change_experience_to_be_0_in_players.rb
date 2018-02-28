class ChangeExperienceToBe0InPlayers < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:players, :experience, from: nil, to: 0.0)
  end
end
