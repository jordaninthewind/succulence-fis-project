class GardenPlantsController < ActionController::Base
	before_action :set_garden_plant, except: :add_garden_plant

	def water_plant
		@garden_plant.last_watered = Time.now
		@garden_plant.add_water_count	#adds to times_watered column
		@garden_plant.save

		redirect_to garden_path(@garden_plant.garden)
	end

	def destroy
		@garden_plant.destroy

		redirect_to garden_path(@garden_plant.garden)
	end

	def add_garden_plant
		@garden = Garden.find(params[:garden_id])
		@garden.plants << Plant.find(params[:plant][:id])

		redirect_to garden_path(@garden)
	end

	private

	def set_garden_plant
	  if params[:garden_plant_id]
		@garden_plant = GardenPlant.find(params[:garden_plant_id])
	  elsif params[:id]
	  	@garden_plant = GardenPlant.find(params[:id])
	  end
	end

end
