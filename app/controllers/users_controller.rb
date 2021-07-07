class UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only:[:edit]
def index
@book = Book.new
@users = User.all
@user = current_user
end
def show
@user = User.find(params[:id])
@books = @user.books
@book = Book.new
end

def edit
@user = User.find(params[:id])
end

def update
@user = User.find(params[:id])
flash[:key] = 'You have updated user successfully.'
if @user.update(user_params)
redirect_to user_path(@user.id)
else
render :edit
end
end



private
def user_params
params.require(:user).permit(:name, :introduction, :profile_image)
end
def ensure_correct_user
@user = User.find(params[:id])
unless @user == current_user
redirect_to user_path(current_user.id)
end
end
end