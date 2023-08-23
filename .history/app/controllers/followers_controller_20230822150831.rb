class FollowersController < ApplicationController
  def index
    @followers = User.all
  end
end
