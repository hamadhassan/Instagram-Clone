# frozen_string_literal: true

# This controller handles the management of profile.
class ProfileController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account
  def index; end

  def show
    if account_signed_in? && current_account.id == @account.id
      current_account_posts = Post.where(account_id: current_account.id)
      @linked_posts=current_account_posts
      @show_picture=true
    else
      show_picture=false
    end
  end

  def follow
    if @account.private?
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id, accepted: false)
    else
      Relationship.create_or_find_by(follower_id: current_account.id, following_id: @account.id)
    end
    redirect_to request.referer
  end

  def unfollow
    current_account.followed_accounts.where(follower_id: current_account.id, following_id: @account.id).destroy_all
  end

  def accept_follow_request
    relationship = Relationship.find_by(follower_id: params[:id], following_id: current_account.id)
    if relationship.present?
      relationship.update(accepted: true)
      flash[:success] = 'Follow request accepted.'
    else
      flash[:error] = 'Unable to find the follow request.'
    end
    redirect_to request.referer
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
