class Garden < ApplicationRecord
	belongs_to :user
	has_many :plant_schedules
	has_many :plants, through: :plant_schedules
	
end
