Rails.application.routes.draw do

  root 'welcome#home'

  resources :plants

  resources :gardens do
  	resources :garden_plants
  end

end
