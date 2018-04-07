Rails.application.routes.draw do

  root 'welcome#home'

  # post '/gardens/:id/edit', to: 'gardens#update'
  # post '/gardens/:id/plants/new', to: 'plants#create'
  # post '/gardens/:id/plants/:id/edit', to: 'plants#update'
  # post '/gardens/new', to: 'gardens#create'

  get '/plants/:id/water_plant', to: 'plants#water_plant', as: 'water_plant'

  resources :gardens do
  	resources :plants
  end

  # resources :plants



end
