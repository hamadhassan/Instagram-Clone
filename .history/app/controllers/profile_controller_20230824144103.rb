class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account , only: %i[follow, unfollow show]
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
    # Find the Relationship record by the account_id (follower_id) and the current user's id (following_id)
    relationship = Relationship.find_by(follower_id: params[:id], following_id: current_account.id)

    if relationship.present?
      # Update the 'accepted' attribute to true
      relationship.update(accepted: true)
      flash[:success] = "Follow request accepted."
    else
      flash[:error] = "Unable to find the follow request."
    end

    # Redirect to the previous page or a specific path
    redirect_back(fallback_location: root_path)
  end

  private

  def set_account
    @account=Account.find(params[:id])
  end
end
