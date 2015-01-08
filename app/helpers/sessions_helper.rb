module SessionsHelper
	def current_user
		# use whats stored in session
		# to find which user we are
		@current_user ||= User.find(session[:user_id])
	end
end
