class FollowersController < ApplicationController
  def index
    @followers = Account.all
  end
end
