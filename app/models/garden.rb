class Garden < ApplicationRecord
	has_many :plants
	accepts_nested_attributes_for :plants
end
