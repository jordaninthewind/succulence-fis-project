class GardenPlantsController < ActionController::Base
	before_action :set_garden_plant, except: :add_garden_plant
	before_action :check_owner, except: :add_garden_plant

	def show
		# binding.pry
		respond_to do |f|
			f.html
			f.json {render json: @garden_plant}
		end
	end

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
		
		unless current_user.id == @garden.user.id
			redirect_to root_path
		end

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

	def check_owner
		unless current_user.id == @garden_plant.garden.user.id
			flash[:notice] = "You Don't Have Permissions for This Plant!"

			redirect_to root_path
		end
	end
end
