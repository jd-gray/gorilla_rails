class PostsController < ApplicationController
	before_action :post_find, only: [:show, :edit, :update, :destroy]
	before_action :user_authorized?

	def index
		if params[:q] != nil
			@posts = Post.where( title: /#{params[:q]}/i )
		else
			@posts = Post.all.order("created_at DESC")
		end
	end

	def show
		@comments = Comment.where(post_id: @post)
	end

	def new
		current_user = User.find(session[:user_id])
		@post = current_user.posts.build
	end

	def create
		current_user = User.find(session[:user_id])
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		respond_to do |format|
			format.html { redirect_to posts_path }
      		format.json { head :no_content }
      	end
	end

	private

	def post_find
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :description, :image, :category_id)
	end
end
