class AuthorsController < ApplicationController


    def index
        @authors = Author.search(params[:query])
        #raise params
        render 'index'
    end

    def show
        @author = Author.find(params[:id])
    end

end
