Rails.application.routes.draw do
	root 'orders#new'

  resources :restaurants do
		resources :items
	  resources :orders, only: [:index, :destroy]
	end

	resources :orders, only: [:new, :create]
	
  devise_for :users
  
  mount ActionCable.server => '/cable'
end
