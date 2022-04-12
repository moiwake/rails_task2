Rails.application.routes.draw do
  devise_for :users
  get "users/:id/profile", to: "users#edit", as: "profile"
  patch "users/:id", to: "users#renewal", as: "profile_renewal"

  get 'pages/index'
  root to: "pages#index"

  resources :hotels

  resources :bookings do
    collection do
      post :confirm, action: :confirm
      post :back, action: :back
      post :complete, action: :complete
    end
  end

  resources :bookings

  resources :pages do
    collection do
      get "search"
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
