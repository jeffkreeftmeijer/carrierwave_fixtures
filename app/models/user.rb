require_relative '../uploaders/avatar_uploader'

class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
