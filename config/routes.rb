Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'welcome#home'

  resources :gardens do
  	resources :plants
  end

  resources :plants

  get 'gardens/:garden_id/plants/:id/water_plant', to: 'garden_plants#water_plant', as: 'water_plant'
  # how to refactor this into a post route
end
