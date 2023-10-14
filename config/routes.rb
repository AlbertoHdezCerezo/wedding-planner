# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Lookbook::Engine, at: "/rails/lookbook" if Rails.env.development?

  # Weddings
  # --------
  resources :weddings, only: %i[show]
end
