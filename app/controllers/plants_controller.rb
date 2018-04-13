class PlantsController < ApplicationController
	before_action :set_plant, except: [:new, :create, :index]

	def new
		if params[:garden_id]
			@garden = Garden.find(params[:garden_id])
		end
		@plant = Plant.new
	end

	def create
		if params[:garden_id]#params[:plant_id] && 
			@garden = Garden.find(params[:garden_id])
			@garden.plants << Plant.find(plant_params[:id])
			
			redirect_to @garden
		# elsif params[:garden_id] #@plant.valid? &&
		# 	@plant = Plant.new(plant_params)
		# 	@plant.gardens << Garden.find(params[:garden_id])
		# 	@plant.save

		# 	redirect_to garden_plant_path(@plant.garden, @plant)
		elsif plant_params
		
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
		if params[:garden_id]
			@garden_plant = GardenPlant.where("garden_id = #{params[:garden_id]} AND plant_id = #{params[:id]}").first
			@garden = @garden_plant.garden
			@plant = @garden_plant.plant
		else
			@plant = Plant.find(params[:id])
		end

	end

	def index
		# add in logic to mitigate permissions
		if params[:garden_id] # && current_user.gardens.include?(Garden.find(params[:garden_id]))
		  @garden = Garden.find(params[:garden_id])
		  @plants = @garden.plants
		  @garden_plants = GardenPlant.where("garden_id = #{@garden.id}")
	      # binding.pry

	    else
	      @plants = Plant.all
	    end
	end

	def destroy
		@garden = @plant.garden
		@plant.destroy
		
		redirect_to garden_path(@garden)
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def plant_params
		params.require(:plant).permit(:name, :genus, :species, :water_frequency, :id)
	end

end
