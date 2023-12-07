class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.integer :max_space
      t.integer :av_space
      t.string :origin
      t.string :destination
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
