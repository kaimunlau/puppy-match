Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"

  resources :pets, only: %i[index show] do
    resources :bookings, only: %i[new create] do
      resources :reviews, only: %i[new create]
    end
  end
  resources :bookings, only: %i[destroy]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
