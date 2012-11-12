class VotesController < ApplicationController
	
	def create
		post = Post.find(params[:post_id])
		vote = post.votes.create(params[:vote])
		redirect_to posts_path
	end
end