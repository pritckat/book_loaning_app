class ReplySerializer < ActiveModel::Serializer
  attributes :id, :body, :user, :comment
  belongs_to :comment
  belongs_to :user
end
