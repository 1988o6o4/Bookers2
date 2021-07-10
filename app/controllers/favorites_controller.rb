class FavoritesController < ApplicationController

def create
@book = Book.find(params[:book_id])
favorite = current_user.favorites.new(book_id: @book.id)
favorite.save
# ＃redirect_back(fallback_location: root_url)非同期通信では、redirectがあると画面推移してしまうので削除
end
def destroy
@book = Book.find(params[:book_id])
favorite = current_user.favorites.find_by(book_id: @book.id)
favorite.destroy
end
end
