class Book < ApplicationRecord
    belongs_to :user, optional: true
    has_many :loans

    
    
    def loaned_to 
        Loan.where(book_id: self.id, returned: false)
    end
    
    def loaned?
        loaned_to != [] ? true : false
    end

    def currently_loaned_to
        if self.loaned?
            borrower_id = self.loaned_to.pluck(:borrower_id)[0]
            borrower = User.find(borrower_id)
            borrower.username
        end

    end
end
