class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    #user dashoard - post feed
    @posts= Post.active
    @follower_suggestions=Account.where.not(id: current_account.id)
  end

  def profile
    #user profile
    @account = Account.find_by_username(params[:john])
    @linked_posts = @account.posts.active

  end
  def set_account
    # @account= Account.find_by_username(params[:username])
    @account=Account.find_by_username(:john)
  end
end
