class ApplicationController < ActionController::Base
  protect_from_forgery

	protected
	def authenticate
	  authenticate_or_request_with_http_basic do |username, password|
	  	if Rails.env.production?
	  		if username == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
	  			@admin = true
	  			true
	  		else
	  			false
	  		end
	  	else
	    	if username == "foo" && password == "bar"
	    		@admin = true
	  			true
	  		else
	  			false
	  		end
	  	end
	  end
	end
end
