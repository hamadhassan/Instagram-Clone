# frozen_string_literal: true

# This controller handles the management of followers.
class FollowersController < ApplicationController
  def index
    
    @follower_suggestions = Account.where.not(id: following_ids)
    current_account_id = current_account.id

    # @private_accounts = Account.joins(:followers)
    #                            .where(followers: { follower_id: current_account_id, accepted: false })
    #                            .distinct
    @private_accounts=Account.all
  end
end
