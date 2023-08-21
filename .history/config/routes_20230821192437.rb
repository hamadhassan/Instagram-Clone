# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to: 'accounts#index'
  get '/profile/:username', to: 'accounts#profile', as: :profile
  # resources :likes do
  #   collection do
  #     get 'save_like/:post_id', to: 'likes#save_like', as: :save_like
  #   end
  # end

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
  resources :likes

      # post 'like', to: 'likes#like', as: :like_post
      # post 'dislike', to: 'likes#dislike', as: :dislike_post

end
