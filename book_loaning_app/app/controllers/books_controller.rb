class BooksController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy]
    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user = current_user
        @book.save
        redirect_to book_path(@book)
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
        redirect_if_not_book_owner
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book)
    end

    def destroy
        @book = Book.find(params[:id])
        redirect_if_not_book_owner
        @book.destroy
        redirect_to user_path(current_user)
    end


    private

    def book_params
        params.require(:book).permit(:title, :author, :description)
    end
    
    def redirect_if_not_book_owner
        if @book.user != current_user
            flash.alert = "You are not the owner of this book."
            redirect_to book_path(@book)
        end
    end
    end
