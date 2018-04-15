class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActiveModel::Validations

  before_action :logged_in

  def logged_in
  	current_user
  end

end
