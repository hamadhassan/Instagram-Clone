# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, controllers: { registrations: 'useaccountsrs/registrations' }
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
  resources :public, only: [:homepage]


  devise_scope :account do
    root to: 'devise/sessions#new'
  end
  # devise_for :accounts, controllers: {
  #   sessions: 'accounts/sessions'
  # }
  # #root to: 'public#homepage'
  # root to: 'devise/registrations#new'
end
