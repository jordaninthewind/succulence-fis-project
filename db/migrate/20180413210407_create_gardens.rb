class CreateGardens < ActiveRecord::Migration[5.1]
  def change
    create_table :gardens do |t|
      t.integer :user_id, foreign_key: true
      t.integer :plant_schedule_id, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
