Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "callbacks" }

  resources :gardens do
  	resources :plants, only: [:new, :create]
    resources :garden_plants, except: [:edit, :update]
  end

  resources :plants, only: [:show, :index]

  namespace :admin do
    resources :plants
  end


  # resources :garden_plants, only: [:destroy], as: 'delete_garden_plant'
  get '/garden_plants/:garden_plant_id', to: 'garden_plants#show'  
  get 'gardens/:garden_id/garden_plants/:garden_plant_id/water_plant', to: 'garden_plants#water_plant', as: 'water_plant'
  get 'gardens/:garden_id/plants/:id/add_garden_plant', to: 'garden_plants#add_garden_plant', as: 'add_garden_plant'
		# clean this up
end
