Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'lists#index'
  # Defines the root path route ("/")
  # root "posts#index"
  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
  resources :lists, only: [:index, :show, :create, :destroy] do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create]
  end

end
