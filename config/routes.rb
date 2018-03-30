Rails.application.routes.draw do

  root 'gardens#welcome'

  resources :plants

  resources :gardens do
  	resources :plants
  end

end
