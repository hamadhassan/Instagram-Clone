class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  def index
    #user dashoard -postfeed
    @posts= Post.active
  end
  def profile
    #user profile
    @account = current_account
    @posts = @account.post.active

  end
  def set_account
    @account= Account.find_by_username(params[:username])
  end
end
