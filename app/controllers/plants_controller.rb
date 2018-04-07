class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		# @garden = Garden.find(params[:id])
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)

		if @plant.save
			@plant.garden = Garden.find(params[:id])

			redirect_to @plant
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
		@plant.destroy
		
		redirect_to :index
	end

	def water_plant
		@plant.last_watered = Time.now
		@plant.save

		redirect_to garden_plant_path(@plant)
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :species, :water_frequency)
	end


end
