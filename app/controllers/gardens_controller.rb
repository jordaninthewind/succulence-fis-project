class GardensController < ApplicationController
	before_action :set_garden, except: [:new, :create, :index]

	def new
		@garden = Garden.new
	end

	def create
		@garden = Garden.new(garden_params)

		if @garden.save
			# add in nested params for plant at garden creation
			redirect_to garden_path(@garden)
		else

			render :new
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def index
		@gardens = Garden.all
	end

	private

	def set_garden
		@garden = Garden.find(params[:id])
	end

	def garden_params
		params.require(:garden).permit(:name)
	end

end
