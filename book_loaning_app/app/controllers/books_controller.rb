class BooksController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy]
    def new
        @book = Book.new
        3.times do 
            @book.genres.build 
        end
    end

    def create
        #raise params
        @book = Book.new(book_params)
        @book.author_attributes = (params[:book][:author])
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

    def return 
        @book = Book.find(params[:id])
        @loan = Loan.find_by(book_id: @book.id, returned: false)
        if @loan.borrower_id != current_user.id
            flash.alert = "You have not borrowed this book."
            redirect_to book_path(@book)
        else
            @loan.returned = true
            @loan.save
            redirect_to book_path(@book)
        end
    end


    private

    def book_params
        params.require(:book).permit(:title, :description,
            genre_attributes: [:id, :name])
    end
    
    def redirect_if_not_book_owner
        if @book.user != current_user
            flash.alert = "You are not the owner of this book."
            redirect_to book_path(@book)
        end
    end
    end
