class Plant < ApplicationRecord
	validates_presence_of :name, :water_frequency
	validates_uniqueness_of :name
	has_many :garden_plants
	has_many :gardens, through: :garden_plants
	
	# add scope method for plants that need watering most frequently
	scope :high_demand, -> {}
	scope :low_demand, -> {}
end
