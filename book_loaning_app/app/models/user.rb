class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: {minimum: 6, too_short: " must be at least 6 characters" }
end
