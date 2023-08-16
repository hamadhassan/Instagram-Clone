class Post < ApplicationRecord
  mount_uploader :imag, AvatarUploader

end
