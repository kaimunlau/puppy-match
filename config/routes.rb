Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"

  resources :pets do
    resources :bookings, only: %i[new create] do
      resources :reviews, only: %i[new create]
    end
  end
  resources :bookings, only: %i[destroy]

  namespace :dashboard do
    get "/", to: "users#home"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
