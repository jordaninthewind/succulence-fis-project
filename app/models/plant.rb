class Plant < ApplicationRecord
	validates_uniqueness_of :name

	has_many :garden_plants
	has_many :gardens, through: :plants

end
