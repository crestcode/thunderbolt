class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create, :upvote, :downvote]

  def index
  	@posts = Post.all.sort_by(&:vote_number).reverse
  end

  def new
    @post = Post.new
    @category = Category.new
  end

  def create
    post = Post.new(params[:post])
    category = Category.new(params[:category])
    post.user_id = current_user.id
    if category.name != nil 
      find_category = Category.find_by_name(category.name)
      if find_category != nil
        post.category_id = find_category.id
        find_category.increment!(:popularity)
      else
        category.save
        category.increment!(:popularity)
        post.category_id = category.id
      end
    end
    if post.save
      redirect_to(posts_path, :notice => 'Post was successfully created.')
    else
      render 'new'
    end
  end

  def show
  	@post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def upvote
    post = Post.find(params[:id])
    vote = post.votes.build
    vote.direction = "up"
    vote.user_id = current_user.id
    vote.save
    redirect_to posts_path
  end

  def downvote
    post = Post.find(params[:id])
    vote = post.votes.build
    vote.direction = "down"
    vote.user_id = current_user.id
    vote.save
    redirect_to posts_path
  end    

end
