Rails.application.routes.draw do

  root 'welcome#home'

  resources :gardens do
  	resources :plants
  end

  resources :plants

end
