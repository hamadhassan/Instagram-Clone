class FollowersController < ApplicationController
  def index
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
    redirect_back(fallback_location: post_path(@post))

  end
end
