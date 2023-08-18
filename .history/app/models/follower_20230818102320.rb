class Follower < ApplicationRecord
  validates_uniquenness_of :follower
end
