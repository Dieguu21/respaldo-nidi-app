class AddStatsToTurns < ActiveRecord::Migration[6.0]
  def change
    add_column :turns, :user_id, :integer
    add_column :turns, :name, :string
  end
end
