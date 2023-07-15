class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :destroy]

  def index
    @book = Book.new
    @books = Book.all
    @user_info = current_user
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     @user_info = current_user
     render :index
    end
  end

  def show
    @book = Book.new
    @showbook = Book.find(params[:id])
    @user_info = @showbook.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to book_path(@book.id)
    else
     render :edit
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

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user == current_user
      redirect_to books_path
    end
  end

end
