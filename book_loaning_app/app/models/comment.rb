class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :book
    has_many :replies
    validates :title, presence: :true
    validates :body, presence: :true
end
