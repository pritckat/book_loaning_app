class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        flash.alert = "Please sign in." unless current_user
        redirect_to login_path unless session.include?:user_id
    end

end
