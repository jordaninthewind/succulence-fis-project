class CreateGardenPlants < ActiveRecord::Migration[5.1]
  def change
    create_table :garden_plants do |t|
      t.integer :garden_id
      t.integer :plant_id

      t.timestamps
    end
  end
end
