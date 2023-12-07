class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :turn, null: false, foreign_key: true
      #estos son otros atributos  que necesita la tabla
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
