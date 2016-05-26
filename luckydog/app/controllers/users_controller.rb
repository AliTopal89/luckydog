class UsersController < ApplicationController

	#before_filter :authorize
	
	def index
	end

	def new
		user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			cookies.permanent[:rememeber_me] = user.rememeber_me
			redirect_to '/'
		else
			flash[:error] = "An error occured"
			redirect_to '/signup'
		end
	end

private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :rememeber_me)
	end

end