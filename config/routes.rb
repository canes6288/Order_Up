Rails.application.routes.draw do
  resources :restaurants
  resources :items
  resources :orders
	root 'home#index' 

  devise_for :users
  
  mount ActionCable.server => '/cable'
end
