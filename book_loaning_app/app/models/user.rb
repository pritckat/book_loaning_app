class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :loans, through: :books
    has_many :authors, through: :books
    has_many :comments
    has_many :replies
    
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, too_short: " must be at least 6 characters" }



end
