class AddTimesWateredToGardenPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :garden_plants, :times_watered, :integer, default: 1
  end
end
