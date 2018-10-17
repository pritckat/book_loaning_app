class LoansController < ApplicationController

    def new
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

    private
    
    def loan_params
        params.require(:loan).permit(:return_datetime, :borrower_id, :book_id, :owner_id)
    end
end
