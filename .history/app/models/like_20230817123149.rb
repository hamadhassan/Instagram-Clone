class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniqueness_of :account_id, scope: :post_id
  after_create :increase_post_like_counter
  before_destroy  :decrease_post_like_counter
  private

  def increase_post_like_counter
    Post.find(self.post_id).increment(:total_likes_count).save
  end
  def decrease_post_like_counter
    Post.find(self.post_id).decte(:total_likes_count).save

  end
end
