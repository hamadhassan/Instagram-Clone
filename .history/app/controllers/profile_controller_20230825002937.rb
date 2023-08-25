class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account
  def index

  end
  def show
    current_account_posts_public=Post.where(account_id: current_account.id,private: true)
    current_account_posts_private=Post.where(account_id: current_account.id,private: false) if account_signed_in? && current_account.id == @account.id
    private_accounts_request_accepted = Account.joins(:following_accounts)
    .where(following_accounts: { follower_id: current_account.id, accepted: true })
    following_account_private_post=Post.where(account_id: private_accounts_request_accepted, private: true)

    @linked_posts = if current_account_posts_private.nil?
                  current_account_posts_public
                else
                  current_account_posts_public.or(current_account_posts_private).or(private_accounts_request_accepted)
                end
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