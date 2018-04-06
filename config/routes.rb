Rails.application.routes.draw do

  root 'welcome#home'

  resources :gardens do
  	resources :plants
  end

  resources :plants

  get '/plants/:id/water_plant', to: 'plants#water_plant', as: 'water_plant'

end
