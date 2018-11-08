class AuthorsController < ApplicationController


    def index
        @authors = Author.search(params[:query])
        render 'index'
    end

    def show
        @author = Author.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @author, status: 200}
        end
    end

end
