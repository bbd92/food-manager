Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'foods#index'
  resources :foods, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :categories
end
