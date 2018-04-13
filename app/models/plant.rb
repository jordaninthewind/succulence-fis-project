class Plant < ApplicationRecord
	# validates_uniqueness_of :name
	# validates_presence_of :name, :water_frequency
	has_many :plant_schedules
	has_many :users, through: :plant_schedules

end
