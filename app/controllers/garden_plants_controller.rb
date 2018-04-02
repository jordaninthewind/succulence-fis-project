class GardenPlantsController < ApplicationController

	def new
		@garden_plant = GardenPlant.new
	end

	def create
		@garden_plant = GardenPlant.create(garden_plant_params)
		binding.pry

		redirect_to garden_plant_path(@garden_plant)
	end

	def show
		binding.pry
		@garden
	end

	private

	# def set_garden_plant
	# 	@garden_plant = GardenPlant.find(:)
	# end

	def garden_plant_params
		params.require(:garden_plant).permit(:garden_id, :plant_id)
	end

end
