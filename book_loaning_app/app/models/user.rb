class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :loans, through: :books
    
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: {minimum: 6, too_short: " must be at least 6 characters" }
end
