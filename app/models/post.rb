class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :comments

  field :title, type: String
  field :description, type: String
  field :upvotes, type: Integer, default: 0
  field :downvotes, type: Integer, default: 0

  mount_uploader :image, AvatarUploader

  def date_published
  	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
