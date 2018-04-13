Rails.application.routes.draw do
  resources :plant_schedules
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'welcome#home'

  resources :gardens do
  	resources :plants
  end

  resources :plants

  get '/plants/:id/water_plant', to: 'plants#water_plant', as: 'water_plant'
  # how to refactor this into a post route
end
