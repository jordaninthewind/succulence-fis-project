class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :genus, :species, :water_frequency, :image_url
end
