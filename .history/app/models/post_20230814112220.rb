class Post < ApplicationRecord
  mount_uploade :image, ImageUploader

end
