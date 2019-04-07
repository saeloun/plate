# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  # Authentication
  devise_scope :user do
    get "/login" => "devise/sessions#new", as: :login
    get "/logout" => "sessions#destroy", :as => :logout
    get "/signup" => "registrations#new", :as => :signup
    scope "my" do
      get "profile", to: "registrations#edit"
      put "profile/update", to: "registrations#update"
    end
  end

  authenticated :user do
    resources :dashboard, only: [:index] do
      collection do
        get :home
      end
    end
  end

  unauthenticated do
    as :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :dashboard do
    collection do
      get :about
    end
  end

  resources :contacts

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :users
      root to: "users#index"
    end
  end

  root to: "dashboard#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
