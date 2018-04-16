class Admin::PlantsController < ApplicationController
	before_action :is_admin, :set_plant

	def edit
	end

	def update
		@plant.update(plant_params)

		redirect_to plant_path(@path)
	end

	def destroy
		@plant.garden_plants.destroy_all
		@plant.destroy
		
		redirect_to root_path
	end

	private

	def set_plant
		@plant = Plant.find(params[:id])
	end

	def is_admin
		unless current_user.admin
			redirect_to root_path
		end
	end
end