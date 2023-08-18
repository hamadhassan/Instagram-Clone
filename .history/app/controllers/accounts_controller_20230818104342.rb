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
    @linked_posts = @account.posts.active

  end
  def follow_account
    def follow_account
      follower_id = current_account.id
      following_id = params[:follow_id]
      Follower.create(follower_id: follower_id, following_id: following_id)
      # Add any necessary response or redirect logic here
    end
    follower_id=params[:follow_id]
    Follower.create(follower_id: current_account.id, following_id: follower_id)

  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
