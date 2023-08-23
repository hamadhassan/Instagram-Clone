class FollowersController < ApplicationController
  def index
    following_account = Account.find_by(id: following_id)

    Follower.find_or_create_by(follower_id: current_user.id, following_id: following_id) do |follower|
      follower.accepted = !following_account.private?
  end
end
