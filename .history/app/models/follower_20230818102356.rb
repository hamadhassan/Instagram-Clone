class Follower < ApplicationRecord
  it { should belong_to(:object) } 
  validates_uniquenness_of :follower_id, scope :following_:id
end
