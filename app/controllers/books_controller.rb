class BooksController < ApplicationController
  def index
    @user = current_user
    @books= Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @showbook = Book.find(params[:id])
    @user = @showbook.user
  end

  def create
    @book = current_user.books.create(book_params)
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user_id == current_user.id
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book)
    else
      render "edit"
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

end
