class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :turn, null: false, foreign_key: true
      #estos son otros atributos  que necesita la tabla
      t.text :content
      t.integer :stars, :null => false, :default => 0

      t.timestamps
    end
  end
end
