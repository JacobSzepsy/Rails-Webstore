class Auth0Controller < ApplicationController
	def callback
		session[:userInfo] = request.env['omniauth.auth']
		redirect_to root_path
	end

	def failure
		@error_msg = request.params['message']
	end
end
