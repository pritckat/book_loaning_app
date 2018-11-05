class BooksController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy]
    

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @books = Book.search(params[:query]).where(user_id: @user.id)
            respond_to do |format|
                format.html
                format.json {render json: @books}
            end
        else
            @books = Book.search(params[:query])
        end
    end
    
    def new
        @book = Book.new
        build_genres
    end

    def create
        @book = Book.new(book_params)
        @book.author_attributes = (params[:book][:author])
        @book.user = current_user
        book_save?
    end

    def show
        @book = Book.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @book}
        end
    end

    def edit
        @book = Book.find(params[:id])
        build_genres
        redirect_if_not_book_owner
    end

    def update
        @book = Book.find(params[:id])
        redirect_if_not_book_owner
        @book.author_attributes = (params[:book][:author])
        @book.update(book_params)
        book_save?
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
        return_book_or_redirect
    end


    private

    def book_params
        params.require(:book).permit(:title, :description,
            genres_attributes: [:id, :name])
    end
    
    def redirect_if_not_book_owner
        if @book.user != current_user
            flash.alert = "You are not the owner of this book."
            redirect_to book_path(@book)
        end
    end

    def build_genres
        count = 0
        if params[:book] != nil
            genres = params[:book][:genres_attributes]
            genres.each do |g, h|
                h.each do |h, k|
                    if k!= ""
                        count = count + 1
                    end
                end
            end
        end
        num_genres = @book.genres.count
        num = 3 - count - num_genres
        num.times do 
            @book.genres.build 
        end
    end

    def book_save?
        if @book.save
            redirect_to book_path(@book)
        else
            build_genres
            render new_book_path
        end
    end

    def return_book_or_redirect
        if @loan.borrower_id != current_user.id
            flash.alert = "You have not borrowed this book."
            redirect_to book_path(@book)
        else
            @loan.returned = true
            @loan.save
            redirect_to book_path(@book)
        end
    end

    end
