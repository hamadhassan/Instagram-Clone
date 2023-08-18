class Follower < ApplicationRecord
  validates_uniquenness_of :follower_id, 
end
