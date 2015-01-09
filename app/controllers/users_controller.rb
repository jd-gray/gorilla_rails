class UsersController < ApplicationController
	before_action :user_find, only: [:show, :edit, :update, :destroy]
	# before_action :user_authorized?
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to posts_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
    	if @user.update(user_params)
      		redirect_to posts_path
    	else
      		render 'edit'
    	end
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

	def user_find
		@user = User.find(params[:id])
	end
end
