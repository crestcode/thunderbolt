class PostsController < ApplicationController

  def index
  	@posts = Post.all.sort_by(&:vote_number).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.create(params[:post])
#    @posts = Post.new(params[:post])
#    @posts.save
    redirect_to(posts_path, :notice => 'Post was successfully created.')
  end

  def show
  	@post = Post.find(params[:id])
    @comment = @post.comments.build
  end

end
