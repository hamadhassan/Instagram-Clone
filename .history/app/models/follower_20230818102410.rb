class Follower < ApplicationRecord
  belongs_to :accounts
  validates_uniquenness_of :follower_id, scope :following_:id
end
