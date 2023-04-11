class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = User.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.new
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(@book.user_id)
    else
      render "/books"
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body ,:user_id)
  end
  
end
