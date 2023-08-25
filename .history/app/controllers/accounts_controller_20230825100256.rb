# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile index]
  before_action :find_post, only: %i[like_user_post unlike_user_post]

  # rubocop:disable Metrics/AbcSize

  def index
    @comment = Comment.new
    following_ids = following_account_ids
    private_accounts = private_accounts_request_accepted

    @posts = relevant_posts(private_accounts, following_ids)

    @posts = @posts.order(created_at: :desc)
  end
  # rubocop:enable Metrics/AbcSize

  def accept_follow_request
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    follower = Follower.find_by(following_id: following_account.id, follower_id: current_account.id)
    return unless follower

    redirect_to request.referer

    follower.update(accepted: true)
    redirect_to request.referer
  end

  def follower_suggestions
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    @follower_suggestions = Account.where.not(id: following_ids + [current_account.id])
    current_account_id = current_account.id
    @private_accounts_request = Account.joins(:followed_accounts)
                                       .where(followed_accounts: { following_id: current_account_id, accepted: false })
  end

  def like_user_post
    @post.likes.create(account_id: current_account.id, liked: true)
    redirect_to request.referer
  end

  def unlike_user_post
    like = @post.likes.find_by(account_id: current_account.id, liked: true)
    like.destroy
    redirect_to request.referer
  end

  private

  def create_follower(following_id, follower_id, accepted)
    Follower.create!(following_id:, follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
