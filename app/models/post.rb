class Post
  include Mongoid::Document
  field :title, type: String
  field :description, type: String

  mount_uploader :image, AvatarUploader
end
