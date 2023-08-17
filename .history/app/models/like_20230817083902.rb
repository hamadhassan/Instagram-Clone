class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniquen
end
