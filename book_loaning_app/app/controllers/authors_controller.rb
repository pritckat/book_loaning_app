class AuthorsController < ApplicationController


    def index
        @authors = Author.search(params[:query])
        render 'index'
    end

    def show
        @author = Author.find(params[:id])
        render json: @author, status: 200
    end

end
