class ApplicationController < ActionController::API
	include ActionController::Serialization
	include ActionController::HttpAuthentication::Token::ControllerMethods

	# Add before_action to authenticate all requests
	# Move this to specific controller if you only want to authenticate specific methods

	before_action :authenticate 

	protected

	def authenticate 
		authenticate_token || render_unauthorized
	end

	def authenticate_token 
		authenticate_with_http_token do |token, options|
			@current_user = User.find_by(api_key: token)
		end
	end

	def render_unauthorized(realm = "Application")
		self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    	render json: 'Bad credentials', status: :unauthorized
	end
end
