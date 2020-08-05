Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    # registrations: 'registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :items, only: :index

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :cards, only: [:new, :show]

  
  resources :addresses, only: [:new, :create, :edit, :update]


  resources :products do
    collection do
      get 'search'
    end
  end

  root 'products#index'

end
