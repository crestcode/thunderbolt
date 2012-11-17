class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_username(params[:username])
		if user && user.authenticate(params[:password])
			session[:user] = user
			redirect_to root_path, notice: "You have logged in."
		else
			flash[:error] = "Username and/or password not valid."
			render 'new'	
		end
	end

	def destroy
			session[:user] = nil
			redirect_to root_path, notice: "You have been logged out."
	end

end