class ReplySerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :comment
  belongs_to :user
end
