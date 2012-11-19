class VotesController < ApplicationController
	before_filter :require_user, only: [:create]

	def create
		post = Post.find(params[:post_id])
		vote = post.votes.build(params[:vote])
		vote.user_id = current_user.id
		vote.save
		redirect_to posts_path
	end
end