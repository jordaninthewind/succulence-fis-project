class Garden < ApplicationRecord
	has_many :garden_plants
	has_many :plants, through: :garden_plants
end
