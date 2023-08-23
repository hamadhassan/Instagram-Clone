class Post < ApplicationRecord

  scope active, -> { where(:active => true)}
  # Ex:- scope :active, -> {where(:active => true)}
end
