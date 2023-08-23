# frozen_string_literal: true

Rails.application.routes.draw do
  get 'followers/index'
  devise_for :accounts
  # dashboard
  # resources :accounts, only: [:show]
  get '/profile/', to: 'accounts#accept_follow_request', as: :accept

  get '/dashboard', to: 'accounts#index'
  get '/profile/:username', to: 'accounts#profile', as: :profile
  post 'follow/account', to: 'accounts#follow_account', as: :follow_account
  resources :posts
  resources :comments
  resources :comments do
    get 'edit', on: :member
  end
  resources :public, only: [:homepage]

  devise_scope :account do
    root to: 'devise/sessions#new'
  end
  resources :posts do
    resources :likes
  end
  resources :stories
  resources :followers

end
