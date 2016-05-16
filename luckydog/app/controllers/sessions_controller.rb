class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		# If user exists AND the password is correct
		if user && user.authenticate(params[:session][:password])
			# Save the user id inside the browser cookie. This is how we keep the user
			# logged in when they navigate to around the luckydog site
			session[:user_id] = user.id
			redirect_to '/'
		else
			flash[:error] = 'Invalid email/password combination'
			# If users login does not work, send thek back to where the login forms are
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end
