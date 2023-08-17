class LikesController < ApplicationController
  def index
    #user dashoard -postfeed
    @posts= Post.active
  end
  def profile
    #user profile
    @account = current_account
    @posts = @account.posts.active

  end
  def set_account
    @account= Account.find_by_username(params[:username])
  end
end
