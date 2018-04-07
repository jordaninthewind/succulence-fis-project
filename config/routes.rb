Rails.application.routes.draw do

  root 'welcome#home'
  post '/plants/:id/edit', to: 'plants#update'
  post '/plants/:id/new', to: 'plants#create'
  get '/plants/:id/water_plant', to: 'plants#water_plant', as: 'water_plant'
  
  resources :gardens do
  	resources :plants
  end

  resources :plants



end
