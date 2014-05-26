class SessionsController < ApplicationController

	def new
		render 'new'
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Sign the User in and redirect to the user's show page
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid email/password combination' # Wrong
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url		
	end

end
