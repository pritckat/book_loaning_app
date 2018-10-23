class Author < ApplicationRecord
    has_many :books
    has_many :user_authors
    has_many :users, through: :user_authors
    validates :name, presence: true

    def self.search(query)
        self.where("name LIKE :query", {query: "%#{query}%"})
    end

end
