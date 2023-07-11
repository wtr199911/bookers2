class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @book_info = current_user
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @showbook = Book.find(params[:id])
    @book_info = current_user
  end

  def edit
    @editbook = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
