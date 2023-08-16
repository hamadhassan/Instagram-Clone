class Post < ApplicationRecord
  belongs_to :
  scope active, -> { where(:active => true)}
end
