class CommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		comment = Comment.create(comment_params)
		# @comment.user_id = current_user.id
		# @comment.post_id = @post.id
		redirect_to post_path(comment.post)
		# if @comment.save
		# 	redirect_to post_path(@post)
		# else
		# 	render 'new'
		# end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

end
