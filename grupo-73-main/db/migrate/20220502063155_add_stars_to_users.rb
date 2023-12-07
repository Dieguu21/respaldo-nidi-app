class AddStarsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stars, :integer, :default => 0
    
  end
end
