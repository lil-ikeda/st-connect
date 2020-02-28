Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "events#index"
  
  resources :events do
    member do
      post :join
      delete :unjoin
    end
  end
  
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
  end

end
