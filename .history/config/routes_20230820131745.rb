# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  get '/profile/:username', to: 'accounts#profile', as: :profile
  resources :likes do
    collection do
      get 'save_like/:post_id', to: 'likes#save_like', as: :save_like
    end
  end
  post 'follow/account', to: 'accounts#follow_account', as: :follow_account
  resources :posts, only: %i[new create show]
  resources :comments, only: [:create]


  devise_scope :accounts do
    root to: 'accounts/registrations#new'
  end
  # #root to: 'public#homepage'
  # root to: 'devise/registrations#new'
end
