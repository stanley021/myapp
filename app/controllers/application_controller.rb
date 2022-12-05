require 'pry'

class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user
    helper_method :logged_in?

    def require_login
        if !logged_in? && request.env['PATH_INFO'] != "/users" && request.env['PATH_INFO'] != "/login" && request.env['PATH_INFO'] != "/users"
            redirect_to "/login"
        end
        
    end

    def logged_in?
        !current_user.nil?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        
    end
   

end
