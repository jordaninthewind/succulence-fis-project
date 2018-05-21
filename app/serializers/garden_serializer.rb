class GardenSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :plants
  # has_many :garden_plants
  # has_many :plants

  def plants
  	object.garden_plants.map{|gp| {plant: gp.plant, last_watered: gp.last_watered, garden_plant_id: gp.id}}
  end

end
