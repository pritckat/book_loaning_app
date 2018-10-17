class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)
        @book.user = User.find(5)
        redirect_to book_path(@book)
    end

    def show
        @book = Book.find(params[:id])
    end


    private

    def book_params
        params.require(:book).permit(:title, :author, :description)
    end    
    end
