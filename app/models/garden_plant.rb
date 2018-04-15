class GardenPlant < ApplicationRecord
	belongs_to :garden
	belongs_to :plant
	before_create :set_last_watered_to_now

	# scope :most_watered, -> 

	def add_water_count
		self.update(:times_watered => (self.times_watered + 1))
	end

	private 
	
	def set_last_watered_to_now
    	self.last_watered = Time.now
  	end
end
