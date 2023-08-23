# frozen_string_literal: true

# This controller handles the management of followers.
class FollowersController < ApplicationController
  def index
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
    current_account_id = current_account.id
    @private_accounts = Account.joins(:followers)
                          .where(followers: { follower_id: current_account_id, accepted: false })
                          .distinct

  end




end
