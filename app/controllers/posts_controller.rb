class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def search
    	if params[:search].present?
      		@posts = Post.search(params[:search])
    	else
      		@posts = Post.all?
    	end
  	end

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		current_user = User.find(session[:user_id])
		@post = current_user.posts.build
	end

	def create
		current_user = User.find(session[:user_id])
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "Created new post!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
