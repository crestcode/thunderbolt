class CategoriesController < ApplicationController

	def show
  	@posts = Post.where(:category_id => params[:id]).sort_by(&:vote_number).reverse
  	@category = Category.find(params[:id])
	end

  def upvote
    post = Post.find(params[:id])
    vote = post.votes.build
    vote.direction = "up"
    vote.user_id = current_user.id
    vote.save
    redirect_to category_path(post.category)
  end

  def downvote
    post = Post.find(params[:id])
    vote = post.votes.build
    vote.direction = "down"
    vote.user_id = current_user.id
    vote.save
    redirect_to category_path(post.category)
  end   

end