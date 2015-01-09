module SessionsHelper
	def current_user
		# use whats stored in session
		# to find which user we are
		@current_user ||= User.find(session[:user_id])
	end

	def logged_in?
		session[:user_id] != nil
	end

	def user_authorized?
		if session[:user_id] === nil
			redirect_to root_path
		end
	end

	def same_user?
		if @user.username != current_user.username
			redirect_to posts_path
		end
	end
end
