Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, path: :freaks, only: [:index, :show]
  resources :groups do
    resources :users, only: [:new, :create, :destroy], controller: "groups_users"
  end

  namespace :api do
    namespace :v1 do
      resources :groups, only: [:index]
    end
  end
end
