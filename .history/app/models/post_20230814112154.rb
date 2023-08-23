class Post < ApplicationRecord
  mount_uploader :image, AvatarUploader

end
