class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)
		@plant.garden = Garden.find(params[:garden_id])

		if @plant.save	

			redirect_to @plant.garden
		else
			# work in error notification
			render :new
		end
	end

	def edit
	end

	def update
		@plant.update(plant_params)

		redirect_to @plant
	end

	def show
	end

	def index
		if params[:garden_id]
		  @garden = Garden.find(params[:garden_id])
	      @plants = @garden.plants
	    else
	      @plants = Plant.all
	    end
	end

	def destroy
		@garden = @plant.garden
		@plant.destroy
		
		redirect_to garden_path(@garden)
	end

	def water_plant
		@plant.last_watered = Time.now
		@plant.save
		@garden = @plant.garden

		redirect_to garden_plant_path(@garden, @plant)
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :species, :water_frequency)
	end


end
