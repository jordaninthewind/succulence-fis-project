Rails.application.routes.draw do
  
  root 'welcome#home'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :gardens do
  	resources :plants#, only: [:show]
  end

  resources :plants

  get 'gardens/:garden_id/plants/:id/water_plant', to: 'garden_plants#water_plant', as: 'water_plant'
  # how to refactor this into a post route
end
