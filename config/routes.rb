Rails.application.routes.draw do
  devise_for :users, skip: [:session, :password, :registration],
                     controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  scope "(:locale)", locale: /en|es/ do
    root 'dashboard#index'
    devise_for :users, controllers: {
      registrations:      "users/registrations"
    }, skip: [:omniauth_callbacks]

    resources :users, path: :freaks, only: [:index, :show] do
      resources :games, only: [:new, :create, :destroy], controller: "games_users"
    end

    resources :groups do
      resources :users, only: [:new, :create, :destroy], controller: "groups_users"
      resources :games, only: [:new, :create, :destroy], controller: "games_groups"
    end
    resources :games

    get "changelog", as: :changelog, to: "dashboard#changelog"

    namespace :api do
      namespace :v1 do
        resources :groups, only: [:index]
        resources :users,  only: [:index]
      end
    end
  end

end
