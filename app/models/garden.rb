class Garden < ApplicationRecord
	belongs_to :user
	has_many :garden_plants
	has_many :plants, through: :garden_plants
	validates_presence_of :name
	# accepts_nested_attributes_for :plants

end
