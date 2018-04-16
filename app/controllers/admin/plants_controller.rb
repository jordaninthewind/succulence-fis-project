class Admin::PlantsController < ApplicationController
	before_action :is_admin

	def index
	      @plants = Plant.all
	    end
	end

	def destroy
		@plant = Plant.find(params[:id])
		@plant.garden_plants.destroy_all
		@plant.destroy
		
		redirect_to root_path
	end

	private

	def is_admin
		unless current_user.admin
			redirect_to root_path
		end
	end
end