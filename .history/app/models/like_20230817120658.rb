class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniqueness_of :account_id, scope: :post_id
  after_create :update_post_like_counter
  private
  
  def update_post_like_counter

  end
end
