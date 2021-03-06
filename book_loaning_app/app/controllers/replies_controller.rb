class RepliesController < ApplicationController

    def new
        @comment = Comment.find(params[:comment_id])
        @reply = Reply.new(comment_id: @comment.id, user_id: current_user.id)
    end

    def create
        @reply = Reply.create(reply_params)
        @comment = @reply.comment
        @book = @comment.book
        render json: @reply, status: 201
    end

    private

    def reply_params
        params.require(:reply).permit(:comment_id, :user_id, :body)
    end
end
