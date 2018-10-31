class UsersController < ApplicationController
    before_action :require_login, only: [:show, :index]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all 
    end

    def lending
        @user = User.find(params[:id])
        @loans = Loan.books_i_am_loaning(@user)
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
