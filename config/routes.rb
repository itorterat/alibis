Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :alibis do
    resources :bookings, only: %i[create]
    member do
      patch :archive
    end
  end

  resources :bookings, only: %i[] do
    member do
      patch :accept
      patch :decline
      patch :cancel
    end
  end

  resources :users, only: %i[show]
end
