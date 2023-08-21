# frozen_string_literal: true

module PostsHelper
  def post_liked_by_user?(post_id)
    Like.where(post_id:, account_id: current_account.id).any?
  end
  def thumbnail input
    return self.image.va
  end
end
