module BooksHelper

    def book_loan_links
        @book = Book.find(params[:id])
        if @book.loaned? && @book.currently_loaned_to != current_user.username
            link_to "Loaned to #{@book.currently_loaned_to}", user_path(User.find_by(username: @book.currently_loaned_to))
        elsif @book.currently_loaned_to == current_user.username
            link_to "Return Book", return_book_path(@book)
        elsif !@book.loaned?
            link_to "Loan Book", new_book_loan_path(@book)
        end
    end

    def user_book_links
        @book = Book.find(param[:id])
end
