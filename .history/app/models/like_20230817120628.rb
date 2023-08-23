class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniqueness_of :account_id, scope: :post_id
  after_create
end
