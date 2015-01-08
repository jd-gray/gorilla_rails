class Post
  include Mongoid::Document
  belongs_to :user

  field :title, type: String
  field :description, type: String

  mount_uploader :image, AvatarUploader
end
