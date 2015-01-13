module ApplicationHelper
	def title_search(q)
		@posts = Post.where( title: /"#{q}"/i )
	end
end
