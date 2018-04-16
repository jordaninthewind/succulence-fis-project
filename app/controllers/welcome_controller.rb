class WelcomeController < ApplicationController
	skip_before_action :authenticate_user!
	
	def home
		if current_user
			redirect_to gardens_path
		end
	end

end
