# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile index]
  def index
    @comment = Comment.new
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids + [current_account.id]).limit(5)
    # @posts = Post.joins(account: :followers).where(followers: { accepted: true,
    #                                                             following_id: current_account.id }).distinct
    #Testing Purpose
    #posts=Post.all
    #following_ids = current_account.following.pluck(:id)

    # Then, retrieve the posts from those accounts that are either public or have been accepted
    # @posts = Post.where(account_id: following_ids)
    #              .where("private = ? OR account_id IN (?)", false, following_ids)
    #              .order(created_at: :desc)

    following_ids = current_user.following.pluck(:id)

    # Initialize a hash to store the private_posts_accepted status for each account
    private_posts_accepted = {}

    # Loop through the accounts the current user is following and check if they have accepted the following request
    following_ids.each do |account_id|
      private_posts_accepted[account_id] = Relationship.where(follower: current_user, following_id: account_id, accepted: true).exists?
    end

    # Then, retrieve the posts from those accounts that meet the additional constraint
    @posts = Post.where(account_id: following_ids)
                 .where("(private = ? AND account_id IN (?) AND private_posts_accepted = ?) OR private = ?", true, following_ids, true, false)
                 .order(created_at: :desc)

    # Now you can pass the @posts and private_posts_accepted to your view


  end

  def profile
    if current_account == @account
      @linked_posts = @account.posts
      @show_picture = true
    elsif current_account.private?
      # Public account
      @linked_posts = @account.posts
      @show_picture = true
    else
      @show_picture = false
    end
  end

  def accept_follow_request
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    follower = Follower.find_by(following_id: following_account.id, follower_id: current_account.id)
    return unless follower

    follower.update(accepted: true)
    redirect_to dashboard_path
  end

  private

  def create_follower(following_id, follower_id, accepted)
    Follower.create!(following_id:, follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
