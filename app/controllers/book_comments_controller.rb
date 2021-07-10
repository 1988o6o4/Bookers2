class BookCommentsController < ApplicationController
def create
@book = Book.find(params[:book_id])
@book_comment = BookComment.new(book_comment_params)
@book_comment.user_id = current_user.id
@book_comment.book_id = @book.id
@user = current_user
@book_comment.save

end

def destroy
@book = Book.find(params[:book_id])
@book_comment = @book.book_comments.find(params[:id])
@book_comment.destroy
# ＃非同期での記述の仕方が不明
end

private
def book_comment_params
params.require(:book_comment).permit(:comment)
end


end
