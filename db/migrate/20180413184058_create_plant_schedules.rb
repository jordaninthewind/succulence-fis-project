class CreatePlantSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :plant_schedules do |t|
      t.integer :user_id
      t.integer :plant_id
      t.datetime :last_watered

      t.timestamps
    end
  end
end
