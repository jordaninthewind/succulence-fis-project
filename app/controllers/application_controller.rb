class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActiveModel::Validations
  before_action :authenticate_user!

  def can?(object)
  	current_user.id == object.user_id
  end
end
