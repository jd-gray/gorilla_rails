class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user

  field :title, type: String
  field :description, type: String

  mount_uploader :image, AvatarUploader

  def date_published
  	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
