Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "users/registrations"
  }

  resources :users, path: :freaks, only: [:index, :show]
  resources :groups do
    resources :users, only: [:new, :create, :destroy], controller: "groups_users"
    resources :games, only: [:new, :create, :destroy], controller: "games_groups"
  end
  resources :games

  namespace :api do
    namespace :v1 do
      resources :groups, only: [:index]
      resources :users,  only: [:index]
    end
  end
end
