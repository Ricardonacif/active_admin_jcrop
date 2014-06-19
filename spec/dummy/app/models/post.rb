class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
