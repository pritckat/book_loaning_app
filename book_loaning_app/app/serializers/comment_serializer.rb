class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  belongs_to :book
  belongs_to :user
end
