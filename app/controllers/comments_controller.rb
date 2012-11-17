class CommentsController < ApplicationController
	before_filter :require_user, only: [:create]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to post_path(@post)
		else
			@post.reload
      render 'posts/show'
    end
	end
end