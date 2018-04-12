class GardenPlantsController < ActionController::Base
	def water_plant
		# binding.pry
		@garden_plant = GardenPlant.where("garden_id = #{params[:garden_id]} AND plant_id = #{params[:id]}").first
		@garden_plant.last_watered = Time.now
		@garden_plant.save

		redirect_to garden_plant_path(@garden_plant.garden, @garden_plant.plant)
	end

end
