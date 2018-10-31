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

    # queries

    def self.loaned_to_me(user)
        where("borrower_id = ?", user).where(returned: false)
    end

    def self.books_i_am_loaning(user)
        where("owner_id = ?", user).where(returned: false)
    end
end
