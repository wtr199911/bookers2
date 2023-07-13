class BooksController < ApplicationController

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
    @editbook = Book.find(params[:id])
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

end
