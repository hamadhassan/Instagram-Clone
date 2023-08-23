class Post < ApplicationRecord
  mount_uploader :image, ImageUploaderUploader

end
