class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		# If user exists AND the password is correct
		if user && user.authenticate(params[:session][:password])
			if params[:remember_me]
				cookies.permanent[:remember_me] = user.remember_me
			else
				cookies[:remember_me] = user.remember_me
			end
			# Save the user id inside the browser cookie. This is how we keep the user
			# logged in when they navigate to around the luckydog site
			redirect_to '/'
		else
			flash.now.alert = 'Invalid email/password combination'
			# If users login does not work, send thek back to where the login forms are
			redirect_to '/login'
		end
	end

	def destroy
		cookies.delete(:remember_me)
		redirect_to '/'
	end

end
