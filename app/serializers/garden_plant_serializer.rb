class GardenPlantSerializer < ActiveModel::Serializer
  attributes :id, :plant_id
  belongs_to :gardens
end
