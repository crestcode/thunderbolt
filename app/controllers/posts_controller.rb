class PostsController < ApplicationController

  def index
  	@posts = Post.order('upvotes-downvotes DESC')
  	
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

  def upvote
    @post = Post.find(params[:id])
    @post.update_attribute(:upvotes, @post.upvotes + 1)
    redirect_to(posts_path)
  end

    def downvote
    @post = Post.find(params[:id])
    @post.update_attribute(:downvotes, @post.downvotes + 1)
    redirect_to(posts_path)
  end


end
