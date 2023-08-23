# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def create
    if @account.private?
      # Create a follow request
      current_user.follow_requests.create(account: @account)
      flash[:notice] = "Follow request sent to #{@account}."
    else
      # Directly follow the account
      current_user.follow(@account)
      flash[:notice] = "You are now following #{@account}."
    end
    redirect_to @account
  end
  def index
    @comment = Comment.new
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @posts = Post.where(account_id: following_ids, private: false)
    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profile
    same_user = @signed_in_account== @account

    if same_user || !@account.private?
      @linked_posts = @account.posts
      @show_picture = true
    else
      @linked_posts = @account.private_posts
      @show_picture = false
    end
  end

  def follow_account
    follower_id = current_account.id
    following_id = params[:follow_id]
    if Follower.create!(follower_id:, following_id:)
      flash[:success] = 'Now Following user'
    else
      flash[:danger] = 'Unable to add follower user'
    end
    redirect_to dashboard_path
  end


  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
