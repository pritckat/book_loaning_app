class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create[username: params[:user][:username], password: params[:user][:password], password_confirmation: [:user][:password_confirmation]]
        redirect to new_user_path
    end
end
