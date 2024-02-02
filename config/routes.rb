# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Lookbook::Engine, at: "/rails/lookbook" if Rails.env.development?

  # Weddings
  # --------
  resources :weddings, only: %i[index new create show] do
    resources :events, only: %i[new create edit update destroy]
    resources :invitations, only: %i[index new create edit update destroy]
    resources :guests, only: %i[index new edit create update destroy] do
      # Invitation
      # ----------
      get "invitation", to: "invitation/invitation#show"
    end
    resource :schedule, only: %i[show]
  end

  # Invitations
  # -----------
  get "invitation/:id",
      to: "invitation/invitation#show",
      as: "invitation"
  post "invitation_state_transition",
       to: "invitation/invitation_state_transitions#create",
       as: "invitation_state_transition"
end
