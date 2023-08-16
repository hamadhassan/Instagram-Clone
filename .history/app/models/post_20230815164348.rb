class Post < ApplicationRecord

  scope actice, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
