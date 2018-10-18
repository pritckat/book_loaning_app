class Loan < ApplicationRecord
    belongs_to :book


    def book_title
        book = Book.find(self.book_id)
        book.title 
    end

    def owner_name
        user = User.find(self.owner_id)
        user.username
    end

    def borrower_name
        user = User.find(self.borrower_id)
        user.username
    end
end
