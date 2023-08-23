class FollowersController < ApplicationController
  def index
    following_ids = Follower.where(follower_id: current_account.id, accepted: true).map(&:following_id)
    following_ids << current_account.id
    @posts = Post.where(account_id: following_ids)
    @follower_suggestions = Account.where.not(id: following_ids)
  end
end
