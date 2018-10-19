class Author < ApplicationRecord
    has_many :books
    has_many :user_authors
    has_many :users, through: :user_authors
end
