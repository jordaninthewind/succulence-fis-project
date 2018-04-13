class PlantSchedule < ApplicationRecord
	belongs_to :user
	belongs_to :plant
	before_create :set_last_watered_to_now

  	def set_last_watered_to_now
    	self.last_watered = Time.now
  	end

end
