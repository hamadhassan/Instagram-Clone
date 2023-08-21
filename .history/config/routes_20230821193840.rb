# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  post 'like', to: 'likes#like', as: :like_post
  post 'dislike', to: 'likes#dislike', as: :dislike_post
  # dashboard
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




end
