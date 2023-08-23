class Post < ApplicationRecord
  bel
  scope active, -> { where(:active => true)}
end
