class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            #login via github
            #raise auth_hash.inspect
            oauth_name = request.env["omniauth.auth"]["info"]["nickname"]
            if user = User.find_by(username: oauth_name)
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                user = User.new()
                user.username = oauth_name
                password = SecureRandom.hex
                user.password = password
                user.password_confirmation = password
                user.save
                session[:user_id] = user.id
                redirect_to user_path(user)
            end
        else
            #site login
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash.alert = "Incorrect Credentials"
                redirect_to login_path
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/"
    end
end
