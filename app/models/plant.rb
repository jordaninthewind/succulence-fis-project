class Plant < ApplicationRecord
	validates_uniqueness_of :name

	belongs_to :garden
end
