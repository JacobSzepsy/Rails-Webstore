require 'digest'

class LoginController < ApplicationController
	def login
		if logged_in?
			redirect_to '/'
		end
	end

	def create
		password_digest = Digest::SHA256.base64digest params[:password]
		puts(password_digest)
		user = User.find_by(username: params[:username], password_digest: password_digest)

		if user.nil?
			puts('x')
		else
			session[:user_id] = user.id
			redirect_to '/'
		end
	end
end
