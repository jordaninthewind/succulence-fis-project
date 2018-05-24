class AddImageColumnToPlant < ActiveRecord::Migration[5.1]
  def change
  	add_column :plants, :image_url, :string
  end
end
