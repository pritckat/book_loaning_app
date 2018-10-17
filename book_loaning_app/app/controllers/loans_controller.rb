class LoansController < ApplicationController

    def new
        @loan = Loan.new
    end

    def create
        @loan = Loan.create(loan_params)
        redirect_to book_path(@loan.book)
    end

    private
    
    def loan_params
        params.require(:loan).permit()
    end
end
