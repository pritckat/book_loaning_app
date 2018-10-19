class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :loans, through: :books
    has_many :user_authors
    has_many :authors, through: :user_authors
    
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, too_short: " must be at least 6 characters" }



end
