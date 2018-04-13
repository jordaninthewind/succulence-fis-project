Rails.application.routes.draw do
  
  root 'welcome#home'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :gardens do
  	resources :plants
  end

  resources :plants

  get 'gardens/:garden_id/plants/:id/water_plant', to: 'garden_plants#water_plant', as: 'water_plant'
  get 'gardens/:garden_id/plants/:id/add_garden_plant', to: 'garden_plants#add_garden_plant', as: 'add_garden_plant'
  # how to refactor this into a post route
end
