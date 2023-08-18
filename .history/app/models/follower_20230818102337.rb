class Follower < ApplicationRecord
  validates_uniquenness_of :follower_id, scope :follow, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
