Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'foods#index'
  resources :foods do
    collection do
      get 'how_to_use'
      get 'vegitables'
      get 'meats_and_fishes'
      get 'others'
    end
  end
  resources :users, only: :index do
    collection do
      get 'how_to_use'
      get 'notice'
    end
  end
end
