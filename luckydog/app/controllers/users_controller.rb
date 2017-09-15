class UsersController < ApplicationController
	
	def index
	end

	def new
		user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			cookies.permanent[:remember_me] = user.remember_me
			redirect_to '/'
		else
			flash[:error] = "An error occured"
			redirect_to '/signup'
		end
	end

private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
	end

end