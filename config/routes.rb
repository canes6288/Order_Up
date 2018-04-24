Rails.application.routes.draw do
  resources :restaurants
  resources :items
  resources :orders
	root 'orders#new' 

  devise_for :users
  
  mount ActionCable.server => '/cable'
end
