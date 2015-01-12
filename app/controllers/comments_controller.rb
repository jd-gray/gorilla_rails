class CommentsController < ApplicationController
	before_action :user_authorized?

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

end
