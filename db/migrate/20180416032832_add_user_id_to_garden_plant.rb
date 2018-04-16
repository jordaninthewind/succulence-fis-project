class AddUserIdToGardenPlant < ActiveRecord::Migration[5.1]
  def change
    add_column :garden_plants, :user_id, :integer
  end
end
