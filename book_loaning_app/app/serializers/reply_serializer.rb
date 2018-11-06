class ReplySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body, :comment_id
end
