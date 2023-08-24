# frozen_string_literal: true

# This controller handles the management of followers.
class FollowersController < ApplicationController
  def index
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    @follower_suggestions = Account.where.not(id: following_ids + [current_account.id])
    current_account_id = current_account.id
    @private_accounts = Account.joins(:followed_accounts)
                 .where(followed_accounts: { following_id: current_account_id, accepted: false })
  end
end
