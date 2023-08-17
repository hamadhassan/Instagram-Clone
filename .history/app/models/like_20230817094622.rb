class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniqueness_of :, scope: :post_id
end
