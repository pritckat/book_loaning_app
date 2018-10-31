class Author < ApplicationRecord
    has_many :books
    has_many :users, through: :books
    
    validates :name, presence: true

    def self.search(query)
        self.where("name LIKE :query", {query: "%#{query}%"})
    end

end
