class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account
  def index

  end
  def show
  end
  def follow
    if @account.private?
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id,accepted: false)
    if test
      
    else

    end
    end
  end

  def unfollow
    current_account.followed_accounts.where(follower_id: current_account.id,following_id: @account.id).destroy_all
  end

  private

  def set_account
    @account=Account.find(params[:id])
  end
end
