class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def index
		@plants = Plant.all
	end

	def new
		# if params[:garden_id]
		# 	@garden = Garden.find(params[:garden_id])
		# end
		@plant = Plant.new
	end

	def create
		@plant = Plant.create(plant_params)

		if @plant.valid?
			if params[:garden_id]
				@garden = Garden.find(params[:garden_id])
				@garden.plants << @plant
			
				redirect_to garden_path(@garden)
			else
				@plant.save

				redirect_to @plant
			end		
		else
			@errors = @plant.errors

			render :new
		end
	end

	def show
		# if params[:garden_id]
		# 	@garden_plant = GardenPlant.find(params[:id])
		# 	@plant = @garden_plant.plant
		# else
		@plant = Plant.find(params[:id])
		# end

	end

	private

	def set_plant
		if !params[:garden_id]
			@plant = Plant.find(params[:id])
		end
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :species, :water_frequency, :id)
	end

end
