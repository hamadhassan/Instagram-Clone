class ProfileController < ApplicationController
  before_action :set_account
  def show
  end
  def follow
    Relationship.create_or_find_by(follower_id: current_account, following_id: @account.id)
  end

  def unfollow
    current_account.followed_accounts.where(follower_id: current_account.id,ollowing_id: @account.id)
  end

  private

  def set_account
    @account=Account.find(params[:id])
  end
end
