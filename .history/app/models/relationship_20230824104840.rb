class Relationship < ApplicationRecord
  belongs_to :follower, class:"ac"
end
