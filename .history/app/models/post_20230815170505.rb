class Post < ApplicationRecord
  be
  scope active, -> { where(:active => true)}
end
