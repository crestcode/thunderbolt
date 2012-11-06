class PostsController < ApplicationController
 
  def index
  	@posts = Post.all
  	
  	respond_to do |format|
  		format.html #index.html.erb 
  	end
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(params[:post])
    @posts.save
    redirect_to(posts_path, :notice => 'Post was successfully created.')
  end

  def show
  	@post = Post.find(params[:id])

  	respond_to do |format|
  		format.html #show.html.erb
  	end
  end
end