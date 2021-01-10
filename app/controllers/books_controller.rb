class BooksController < ApplicationController
  def index
    @books= Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
