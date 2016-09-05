Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:show, :new, :create]
end
