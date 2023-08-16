class Post < ApplicationRecord

  scope :name, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
