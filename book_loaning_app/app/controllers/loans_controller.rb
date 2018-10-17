class LoansController < ApplicationController

    def new
        @loan = Loan.new
    end

    def create
        @loan = Loan.new(loan_params)
        @book = Book.find_by(title: "Pup's Book")
        @loan.owner_id = current_user.id
        @loan.book_id = @book.id
        @loan.save
        #raise params
        redirect_to book_path(@book)
    end

    private
    
    def loan_params
        params.require(:loan).permit(:return_datetime, :borrower_id)
    end
end
