class Author < ApplicationRecord
    has_many :books
    has_many :user_authors
    has_many :users, through: :user_authors
    validates :name, presence: true

    def self.search(query)
        if query == ''
            self.all.pluck(:name)
        else
            self.where("name LIKE :query", {query: "%#{query}%"}).pluck(:name)
        end
    end

end
