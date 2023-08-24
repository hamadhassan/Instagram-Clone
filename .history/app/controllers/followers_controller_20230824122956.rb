# frozen_string_literal: true

# This controller handles the management of followers.
class FollowersController < ApplicationController
  def index
    following_ids = Relationship.where(following_id: current_account.id).map(&:follower_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
    current_account_id = current_account.id

    # @private_accounts = Account.joins(:followers)
    #                            .where(followers: { follower_id: current_account_id, accepted: false })
    #                            .distinct
    @private_accounts=Account.all
  end
end
