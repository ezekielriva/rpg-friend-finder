Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'dashboard#index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, path: :freaks, only: [:index, :show]
end
