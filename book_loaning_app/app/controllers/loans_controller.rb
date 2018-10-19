class LoansController < ApplicationController
    before_action :require_login

    def new
        redirect_if_book_already_loaned
        @loan = Loan.new(book_id: params[:book_id], owner_id: current_user.id)
    end

    def create
        @loan = Loan.new(loan_params)
        @loan.returned = false
        @loan.save
        #raise params
        @book = Book.find(@loan.book_id)
        redirect_to book_path(@book)
    end

    def index
        if params[:book_id]
            book = Book.find(params[:book_id])
            @loans = book.loans
        else
            @loans = Loan.all
        end
    end



    private
    
    def loan_params
        params.require(:loan).permit(:return_datetime, :borrower_id, :book_id, :owner_id)
    end

    def redirect_if_book_already_loaned
        book = Book.find(params[:book_id])
        if book.loaned?
            flash.alert = "This book is already loaned to #{book.currently_loaned_to}."
            redirect_to book_path(book)
        end
    end
end
