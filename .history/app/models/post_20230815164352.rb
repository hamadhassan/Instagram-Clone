class Post < ApplicationRecord

  scope active, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
