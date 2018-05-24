class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def index
		@plants = Plant.all.sort_by { |plant| plant.name }

		respond_to do |format|
			format.html
			format.json { render json: @plants }
		end
	end

	def new
		# if params[:garden_id]
		# 	@garden = Garden.find(params[:garden_id])
		# end
		@plant = Plant.new

		render layout: false
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
		respond_to do |format|
			format.html {render layout: false}
			format.json {render json: @plant}
		end
	end

	private

	def set_plant
		if !params[:garden_id]
			@plant = Plant.find(params[:id])
		end
	end

	def plant_params
		params.require(:plant).permit(:id, :name, :genus, :water_frequency, :image_url)
	end

end
