class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)
		@plant.garden = Garden.find(params[:garden_id])
		# how to reorganize for garden_plants join model

		if @plant.valid?
			@plant.save

			redirect_to garden_plant_path(@plant.garden, @plant)
		else
			@errors = @plant.errors
			# work in error notification
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
	end

	def index
		if params[:garden_id]
		  @garden = Garden.find(params[:garden_id])
		  binding.pry
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

		redirect_to garden_plant_path(@plant.garden, @plant)
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :species, :water_frequency)
	end


end
