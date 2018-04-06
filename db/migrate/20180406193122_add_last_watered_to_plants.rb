class AddLastWateredToPlants < ActiveRecord::Migration[5.1]
  def change
  	add_column :plants, :last_watered, :datetime
  end
end
