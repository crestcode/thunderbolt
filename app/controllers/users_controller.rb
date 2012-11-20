class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user] = @user
			redirect_to root_path, notice: "Welcome, #{@user.username}"
		else
			render 'new', error: "Hm. Something went wrong. Maybe that username is already taken!"
		end
	end

	def show
		@user = User.find(params[:id])
		@twitter = @@twitter_client
		@last_ten_posts = Post.order('created_at DESC').where(:user_id => params[:id]).limit(10)
		@last_ten_comments = Comment.order('created_at DESC').where(:user_id => params[:id]).limit(10)
		@last_ten_votes = Vote.order('created_at DESC').where(:user_id => params[:id]).limit(10)
	end

end