class Garden < ApplicationRecord
	has_many :plants
	belongs_to :user
	
	accepts_nested_attributes_for :plants
end
