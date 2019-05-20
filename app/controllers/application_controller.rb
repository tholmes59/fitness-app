class ApplicationController < ActionController::Base
    rotect_from_forgery with: :exception

    helper_method :current_user
    helper_method :logged_in?
    before_action :require_login, except: [:new, :index]

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
        !!current_user
    end 

    def require_login
        redirect_to root_path unless logged_in?
    end 

end
