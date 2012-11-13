class CommentsController < ApplicationController
	
	def create
		post = Post.find(params[:post_id])
		comment = post.comments.create(params[:comment])
		if comment.valid?
			redirect_to post_path(post)
		else
			@post = Post.find(params[:post_id])
			@comment = @post.comments.create(params[:comment])
			@comment.content = nil
      render 'posts/show'
    end
	end
end