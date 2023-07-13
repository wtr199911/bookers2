class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user_info = current_user
  end

  def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to book_path(@user.id)
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @user_info = current_user
  end

  def edit
    @edituser = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
