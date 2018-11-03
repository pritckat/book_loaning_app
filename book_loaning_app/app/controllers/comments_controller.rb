class CommentsController < ApplicationController

    def new
        @book = Book.find(params[:book_id])
        @comment = Comment.new(user_id: current_user.id, book_id: @book.id)
    end

    def create
        @comment = Comment.new(comment_params)
        @book = Book.find(params[:book_id])
        if @comment.save
            redirect_to book_path(@book)
        else
            render new_comment_path(@comment)
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:book_id, :user_id, :title, :body)
    end

end
