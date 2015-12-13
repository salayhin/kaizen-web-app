class Weather < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
