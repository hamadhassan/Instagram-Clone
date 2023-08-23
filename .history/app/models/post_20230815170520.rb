class Post < ApplicationRecord
  belongs_to :accounts
  scope active, -> { where(:active => true)}
end
