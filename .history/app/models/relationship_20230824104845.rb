class Relationship < ApplicationRecord
  belongs_to :follower, class:"Account"
end
