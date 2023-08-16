class Post < ApplicationRecord
  belongs_to :account
  scope active, -> { where active => true}

  pr
end
