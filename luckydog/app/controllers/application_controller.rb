class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by_remember_me(cookies[:remember_me]) if cookies[:remember_me]
  end
  helper_method :current_user

  def authorize
  	redirect_to '/login' unless current_user
  end

end
