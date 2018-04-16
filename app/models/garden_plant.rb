class GardenPlant < ApplicationRecord
	belongs_to :garden
	belongs_to :plant

	before_create :set_last_watered_to_now
	# before_create :set_user

	# scope :most_watered, -> {where("times_watered")}
	# scope :overdue, -> {where("last_watered < ?", (self.plant.water_frequency * 86400) - Time.now)}

	# (Time.now - garden_plant.last_watered) > (garden_plant.plant.water_frequency * 86400)

	def user
		self.garden.user
	end

	def add_water_count
		self.update(:times_watered => (self.times_watered + 1))
	end

	private
	
	def set_last_watered_to_now
    	self.last_watered = Time.now
  	end
end
