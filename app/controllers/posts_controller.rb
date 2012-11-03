class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])

  	respond_to do |format|
  		format.html #show.html.erb
  	end
  end
end