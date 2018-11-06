class ReplySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body, :comment_id
  belongs_to :comment
  belongs_to :user
end
