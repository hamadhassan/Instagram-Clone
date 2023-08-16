class Post < ApplicationRecord

  scope active, -> { where(:active => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
