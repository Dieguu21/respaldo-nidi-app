class AddPatentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :patent, :string
  end
end
