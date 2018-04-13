class Plant < ApplicationRecord
	# validates_uniqueness_of :name
	# validates_presence_of :name, :water_frequency
	has_many :plant_schedules
	has_many :users, through: :plant_schedules
	# before_create :set_last_watered_to_now

  	# def set_last_watered_to_now
   #  	self.last_watered = Time.now
  	# end

end
