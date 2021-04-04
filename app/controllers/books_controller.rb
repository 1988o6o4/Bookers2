class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:edit]
  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @user = current_user
  if @book.save
  flash[:key] = 'You have created book successfully.'
  redirect_to book_path(@book.id)
  else
  # flash[:error] = "error"
  @books=Book.all
  render 'index'
  end
  end


  def index
  @books = Book.all
  @book = Book.new
  @user = current_user
  end

  def show
  @book = Book.find(params[:id])
  @book_new = Book.new
  @user = @book.user
  end

  def edit
  @book = Book.find(params[:id])
  end
  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
  flash[:key] = 'You have updated book successfully.'
  redirect_to book_path(@book.id)
  else
  render 'edit'
  end
  end

  def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def ensure_correct_user
  @book = Book.find(params[:id])
  unless @book.user == current_user
  redirect_to books_path
  end
  end
end
