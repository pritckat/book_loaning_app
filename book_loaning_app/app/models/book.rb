class Book < ApplicationRecord
    belongs_to :user
    belongs_to :author, optional: true
    has_many :loans
    has_many :genres

    validates :title, presence: true
    
    accepts_nested_attributes_for :genres, reject_if: :all_blank

    
    def author_attributes=(author)
        self.author = Author.find_or_create_by(name: author)
        self.author.save
    end

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

    def self.last_five(user)
        where("user_id = ?", user.id).order(created_at: :desc).take(5)
    end

    def self.search(query)
        self.where("title LIKE :query", {query: "%#{query}%"})
    end

    def author?
        self.author == nil ? "" : self.author.name
    end
end
