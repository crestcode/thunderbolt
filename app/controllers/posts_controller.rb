class PostsController < ApplicationController
 
  def index
  	@posts = Post.all
  	
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.create(params[:post])
#    @posts = Post.new(params[:post])
#    @posts.save
    redirect_to(posts_path, :notice => 'Post was successfully created.')
  end

  def show
  	@post = Post.find(params[:id])

  end
end
