class GardenSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_many :garden_plants
  # has_many :plants, through: :garden_plants
end
