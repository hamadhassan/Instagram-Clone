class Follower < ApplicationRecord
  belongs
  validates_uniquenness_of :follower_id, scope :following_:id
end
