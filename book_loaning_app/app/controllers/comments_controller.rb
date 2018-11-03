class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render book_path(@book)
        else
            render new_comment_path(@comment)
    end


    private

    def comment_params
        params.require(:comment).permit(:book_id, :user_id, :title, :body)
    end
end
end
