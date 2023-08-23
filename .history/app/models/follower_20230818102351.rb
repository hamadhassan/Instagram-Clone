class Follower < ApplicationRecord
  validates_uniquenness_of :follower_id, scope :following_:id
end
