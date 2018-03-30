class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)

		if @plant.save
			redirect_to @plant
		else
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
		@plants = Plant.all
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name)
	end


end
