class GardenPlantsController < ActionController::Base
	def water_plant
		@garden_plant = GardenPlant.find(params[:garden_plant_id])
		@garden_plant.last_watered = Time.now
		@garden_plant.add_water_count
		@garden_plant.save

		redirect_to garden_path(@garden_plant.garden)
	end

	def add_garden_plant
		@garden = Garden.find(params[:garden_id])
		@garden.plants << Plant.find(params[:plant][:id])

		redirect_to garden_path(@garden)
	end
end
