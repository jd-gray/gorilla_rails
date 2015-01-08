class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
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

end
