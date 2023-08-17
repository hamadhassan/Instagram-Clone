class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  it { should validate_uniqueness_of(:attribute) }
end
