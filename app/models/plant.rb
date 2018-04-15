class Plant < ApplicationRecord
	# validates_uniqueness_of :name
	validates_presence_of :name, :water_frequency
	validates_uniqueness_of :name
	has_many :garden_plants
	has_many :gardens, through: :garden_plants
	
end
