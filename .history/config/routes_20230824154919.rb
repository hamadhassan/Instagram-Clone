# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  # The below line comment for testing
  # get '/profile/:username', to: 'accounts#profile', as: :profile
  # get 'profile/show'
  # get 'followers/index'
  # post 'follow/account', to: 'accounts#follow_account', as: :follow_account
  # post 'follow/accept_follow_request', to: 'accounts#accept_follow_request', as: :accept_follow_request

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
  resources :profile, only: [:index]
  get 'profile/:id', to: 'profile#show', as: :profile
  post 'profile/follow', to: 'profile#follow'
  delete 'profile/unfollow', to: 'profile#unfollow'
  post 'profile/accept_follow_request', to: 'profile#accept_follow_request'


end
