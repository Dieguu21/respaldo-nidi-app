class AddCarColorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :car_color, :string
  end
end
