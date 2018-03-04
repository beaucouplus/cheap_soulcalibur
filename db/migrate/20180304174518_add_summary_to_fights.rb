class AddSummaryToFights < ActiveRecord::Migration[5.1]
  def change
    add_column :fights, :summary, :text
  end
end
