class Plant < ApplicationRecord
	# validates_uniqueness_of :name
	validates_presence_of :name, :water_frequency
	belongs_to :garden

	before_create :set_last_watered_to_now

  	def set_last_watered_to_now
    	self.last_watered = Time.now
  	end

end
