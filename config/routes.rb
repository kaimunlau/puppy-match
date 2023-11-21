Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"
  resources :bookings
  resources :pets do
    resources :reviews, only: %i[new create show edit]
  end

  resources :pets, only: %i[index show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
