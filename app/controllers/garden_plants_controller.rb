class GardenPlantsController < ActionController::Base
	def water_plant
		@garden_plant = GardenPlant.where("garden_id = #{params[:garden_id]} AND plant_id = #{params[:id]}").first
		@garden_plant.last_watered = Time.now
		@garden_plant.save

		redirect_to garden_plant_path(@garden_plant.garden, @garden_plant.plant)
	end

	def add_garden_plant
		@garden = Garden.find(params[:garden_id])
		@garden.plants << Plant.find(params[:id])

		redirect_to garden_path(@garden)
	end
end
