class Post < ApplicationRecord
  belongs
  scope active, -> { where(:active => true)}
end
