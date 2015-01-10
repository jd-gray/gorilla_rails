class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :user_authorized?

	# def search
 #    	if params[:search].present?
 #      		@posts = Post.search(params[:search])
 #    	else
 #      		@posts = Post.all?
 #    	end
 #  	end

	def index
		@posts = Post.all.order("created_at DESC")
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
		redirect_to post_path
	end

	def upvote
		@post.upvotes += 1
		@post.save
		redirect_to :back
	end

	def downvote
		@post.downvotes += 1
		@post.save
		redirect_to :back
	end


	private

	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
