# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  get 'follower_suggestions', to: 'accounts#follower_suggestions'
  #post 'like_user_post', to: "accounts#like_user_post"
  #delete 'unlike_user_post', to: "accounts#unlike_user_post"

  resources :accounts do
    post 'like_user_post/:post_id', on: :member
    delete 'unlike_user_post', on: :member
  end

  resources :posts
  resources :comments
  resources :comments do
    get 'edit', on: :member
  end
  resources :public, only: [:homepage]

  devise_scope :account do
    root to: 'devise/sessions#new'
  end
  # resources :posts do
  #   resources :likes
  # end
  resources :stories
  resources :followers

  get 'search/index'


  resources :profile, only: [:index]
  get 'profile/:id', to: 'profile#show', as: :profile
  post 'profile/follow', to: 'profile#follow'
  delete 'profile/unfollow', to: 'profile#unfollow'
  post 'profile/accept_follow_request', to: 'profile#accept_follow_request'

end
