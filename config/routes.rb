Rails.application.routes.draw do

  root 'welcome#home'

  resources :plants

  resources :gardens do
  	resources :plants
  end

end
