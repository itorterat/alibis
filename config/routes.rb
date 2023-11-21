Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :alibis do
    member do
      patch 'archive'
    end
  end

  resources :users, only: %i[show]
end
