class Relationship < ApplicationRecord
  belongs_to :follower, class:"Account"
  belongs_to :following, class:"Account"
end
