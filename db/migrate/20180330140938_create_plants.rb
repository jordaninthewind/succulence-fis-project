class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :genus
      t.string :species
      t.integer :water_frequency
      t.integer :garden_id, foreign_key: true

      t.timestamps
    end
  end
end
