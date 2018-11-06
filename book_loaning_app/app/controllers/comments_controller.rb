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

    def show
        @comment = Comment.find(params[:id])
        respond_to do |format|
            format.html
            format.json {render json: @comment}
        end
    end

    def index
        @comments = Comment.where(book_id: params[:book_id])
        render json: @comments
    end


    private

    def comment_params
        params.require(:comment).permit(:book_id, :user_id, :title, :body)
    end

end
