Rails.application.routes.draw do

  devise_for :users
  root to: 'restaurants#index'

  resources :restaurants do
	  resources :tables, only: [:new, :edit, :create, :update, :destroy] do
	  	resources :reservations, only: [:new, :create, :edit, :update, :destroy]
	  end
	end

end
