class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def index
	    @plants = Plant.all
	end

	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)

		if @plant.valid?
			@plant.save

			redirect_to plant_path(@plant.garden, @plant)
		else
			@errors = @plant.errors

			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		binding.pry
		@plant.update(plant_params)

		if @plant.valid?
			@plant.save

			redirect_to plant_path(@plant.garden, @plant)
		else
			@errors = @plant.errors

			render :new
		end
	end

	def destroy
		@garden = @plant.garden
		@plant.destroy
		
		redirect_to garden_path(@garden)
	end

	# def water_plant
	# 	@plant.last_watered = Time.now
	# 	@plant.save

	# 	redirect_to garden_plant_path(@plant.garden, @plant)
	# end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :water_frequency)
	end

end
