class User
  include Mongoid::Document

  has_many :posts
  has_many :comments

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  mount_uploader :user_image, AvatarUploader

  attr_reader :password


  def password=(unencrypted_password)
  	 unless unencrypted_password.empty?
  		# store unencrypted pw in memory
  		@password = unencrypted_password
  		# use BCrypt to encrypt plain pw
  		# and store it in DB
  		self.password_digest = BCrypt::Password.create(unencrypted_password)
  	 end
  end

  # method to auth user
  # if the user enters pw that match encrypted pw -> return self
  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  		return self
  	else
  		return false
  	end
  end

  # validates if name, email, and password exists
  # validates_presence_of :name, :email, :password --> another way
  validates :username, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  # length is 6-20
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true
  # unless => password_digest.present?
end
