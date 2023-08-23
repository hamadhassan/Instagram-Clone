class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  @account= Account.find_by_username(params[:username])
  def index
    #user dashoard - post feed
    @posts= Post.active
    @follower_suggestions=Account.where.not(id: current_account.id)
  end

  def profile
    #user profile

    @account = current_account

    @posts = @account.posts.active

  end
  def set_account

  end
end
