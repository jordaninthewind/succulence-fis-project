class Garden < ApplicationRecord
	belongs_to :user
	has_many :plants
	

	accepts_nested_attributes_for :plants
end
