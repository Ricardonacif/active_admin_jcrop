class Post < ActiveRecord::Base
  DEFAULT_CROP_OPTIONS = {aspectRatio: 1}
  mount_uploader :image, ImageUploader
end
