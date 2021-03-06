class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(email: params[:login][:email]).first
		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
			redirect_to posts_path
		else
			redirect_to root_path
		end
	end

	def destroy
		# delete key/value pair in sessions
		session.delete(:user_id)
		redirect_to root_path
	end
end
