# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile show]
  def index
    @comment = Comment.new
    following_ids = Follower.where(following_id: current_account.id).map(&:follower_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids).limit(2)
    @posts = Post.where(account_id: following_ids, private: false)
  end

  def profile
    same_user = @signed_in_account == @account

    if same_user || !@account.private?
      @linked_posts = @account.posts
      @show_picture = true
    else
      # @linked_posts = @account.private_posts
      @show_picture = false
    end
  end

  def follow_account
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    existing_follower = Follower.find_by(follower_id: current_account.id, following_id:)

    if following_account.private?
      create_follower(following_id,current_account.id, false) unless existing_follower
    else
      create_follower(following_id,current_account.id, true) unless existing_follower
    end

    redirect_to dashboard_path
  end

  def accept_follow_request
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)

    #  'follower' is an instance of the Follower model representing the relationship
    follower = Follower.find_by(following_id: following_account.id, follower_id: current_account.id)

    if follower
      follower.update(accepted: true)
      # Optionally, you can also add other updates here as needed.
    else
      # Handle the case where the follower record was not found
      # You might want to provide an error message or take appropriate action.
    end
  end

  private

  def create_follower(follower_id, following_id, accepted)
    Follower.create!(following_id:,follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
