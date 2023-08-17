class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account account_id
  validates_uniqueness_of :, scope: :post_id
end
