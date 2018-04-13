class CreatePlantSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :plant_schedules do |t|
      t.integer :user_id, foreign_key: true
      t.integer :plant_id, foreign_key: true
      t.datetime :last_watered

      t.timestamps
    end
  end
end
