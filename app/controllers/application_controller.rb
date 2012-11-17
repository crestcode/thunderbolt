class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?
  protect_from_forgery

  def current_user
  	session[:user]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:error] = "You must be logged in to access this section."
  		redirect_to root_path
  	end
  end

end
