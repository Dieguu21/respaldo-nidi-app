class AddStatsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :binary
    add_column :users, :is_admin, :boolean
  end
end
