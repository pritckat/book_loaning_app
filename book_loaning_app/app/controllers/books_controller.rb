class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)
    end

    def show
        @book = Book.find(params[:id])
    end


    private

    def book_params
        params.require(:book).permit(:title, :author, :description)
    end    
    end
