class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		if params[:garden_id]
			@garden = Garden.find(params[:garden_id])
		end
		@plant = Plant.new
	end

	def create
		@plant = Plant.create(plant_params)

		if @plant.valid?
			if params[:garden_id]
				@garden = Garden.find(params[:garden_id])

				@garden.plants << @plant
			
				redirect_to @garden
			else
				@plant.save

				redirect_to @plant
			end		
		else
			@errors = @plant.errors

			render :new
		end
	end

	def edit
	end

	def update
		@plant.update(plant_params)

		redirect_to garden_plant_path(@plant.garden, @plant)
	end

	def show
		if params[:garden_id]
			@garden_plant = GardenPlant.find(params[:id])
			@plant = @garden_plant.plant
		else
			@plant = Plant.find(params[:id])
		end

	end

	def index
		if params[:garden_id] # && current_user.gardens.include?(Garden.find(params[:garden_id]))
		  @garden = Garden.find(params[:garden_id])
		  @plants = @garden.plants
		  @garden_plants = @garden.garden_plant

	    else
	  
	      @plants = Plant.all
	    end
	end

	def destroy
		if params[:garden_id]
			@garden_plant = GardenPlant.find(params[:id])
			@garden_plant.destroy
		else
			@plant = Plant.find(params[:id])
			@plant.destroy
		end
		
		redirect_to root_path
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
