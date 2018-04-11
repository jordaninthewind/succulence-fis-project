class WelcomeController < ApplicationController
	def home
		if current_user
			redirect_to '/gardens/index'
		else
			render :'/home'
		end
	end

end
