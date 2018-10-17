class Book < ApplicationRecord
    belongs_to :user, optional: true
    has_many :loans

    def loaned?
        Loan.where(book_id: self.id) != [] ? true : false
    end

end
