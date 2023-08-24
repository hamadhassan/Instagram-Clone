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

    following_ids = current_account.following.pluck(:id)
    @posts = Post.where(account_id: following_ids)

    # Assuming you want to get the accounts with accepted = true
accounts_with_accepted_relationships = Account.joins(:following_accounts).where(relationships: { accepted: true }).distinct

# This will give you a list of Account records that have accepted relationships.


    accepted_following_accounts = Account.joins(:followed_accounts)
                                      .where(relationships: { accepted: true })
    private_posts = Post.where(private: true, account: accepted_following_accounts)

    @posts = @posts.or(private_posts)
    @posts = @posts.order(created_at: :desc)


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
