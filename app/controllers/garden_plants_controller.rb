class GardenPlantsController < ApplicationController
	before_action :set_garden, except: [:new]


	def new
		@garden_plant = GardenPlant.new
	end

	def create
		@garden_plant = GardenPlant.create(garden_plant_params)

		redirect_to garden_path(@garden)
	end

	def destroy
		@garden_plant = GardenPlant.find(params[:id])
		@garden_plant.destroy

		redirect_to garden_path
	end

	# def show
	# 	binding.pry
	# 	@garden
	# end

	private

	def set_garden
		@garden = Garden.find(params[:garden_id])
	end
	# def set_garden_plant
	# 	@garden_plant = GardenPlant.find(:)
	# end

	def garden_plant_params
		params.require(:garden_plant).permit(:garden_id, :plant_id)
	end

end
