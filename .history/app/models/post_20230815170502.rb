class Post < ApplicationRecord

  scope active, -> { where(:active => true)}
end
