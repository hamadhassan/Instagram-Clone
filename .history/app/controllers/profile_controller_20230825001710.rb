class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account
  def index

  end
  def show
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    current_account_posts=Post.where(account_id: current_account.id)
    following_ids_list = current_account.following.pluck(:id)
    following_acount_public_post=Post.where(account_id: following_ids,private: false)
    private_accounts_request_accepted = Account.joins(:following_accounts)
                  .where(following_accounts: { follower_id: current_account.id, accepted: true })
    following_account_private_post=Post.where(account_id: private_accounts_request_accepted, private: true)
    @linked_posts =current_account_posts.or(following_acount_public_post).or(following_account_private_post)
  end
  def follow
    if @account.private?
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id,accepted: false)
    else
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id)
    end
    redirect_to request.referer

  end

  def unfollow
    current_account.followed_accounts.where(follower_id: current_account.id,following_id: @account.id).destroy_all
  end

  def accept_follow_request
    relationship = Relationship.find_by(follower_id: params[:id], following_id: current_account.id)
    if relationship.present?
      relationship.update(accepted: true)
      flash[:success] = "Follow request accepted."
    else
      flash[:error] = "Unable to find the follow request."
    end
    redirect_to request.referer
  end


  private

  def set_account
    @account=Account.find(params[:id])
  end
end
