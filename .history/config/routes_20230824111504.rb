# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profile/show'
  get 'followers/index'
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  # get '/profile/:username', to: 'accounts#profile', as: :profile
  post 'follow/account', to: 'accounts#follow_account', as: :follow_account
  post 'follow/accept_follow_request', to: 'accounts#accept_follow_request', as: :accept_follow_request

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

  get 'search/index'

  #Relationship Routes
  get 'p/:username', to: 'profile#show'
  post 'profile/follow', to: 'profile#follow'
  delete 'profile/unfollow', to: 'profile#unfollow'
end
