class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account , only: %i[follow, unfollow]
  def index

  end
  def show
  end
  def follow
    if @account.private?
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id,accepted: false)
    else
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id)
    end
  end

  def unfollow
    current_account.followed_accounts.where(follower_id: current_account.id,following_id: @account.id).destroy_all
  end

  def accept_follow_request
    follower_id = Account.find(params[:follower_id])
    Relationship.update(follower_id: follower_id, , accepted: true)
    redirect_back(fallback_location: root_path, notice: "Relationship accepted")


  private

  def set_account
    @account=Account.find(params[:id])
  end
end
