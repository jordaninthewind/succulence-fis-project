class CreateGardenPlants < ActiveRecord::Migration[5.1]
  def change
    create_table :garden_plants do |t|
      t.integer :garden_id, foreign_key: true
      t.integer :plant_id, foreign_key: true
      t.datetime :last_watered

      t.timestamps
    end
  end
end
