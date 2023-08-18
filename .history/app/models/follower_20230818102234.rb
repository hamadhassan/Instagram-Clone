class Follower < ApplicationRecord
  it { should validate_uniqueness_of(:attribute) }
end
