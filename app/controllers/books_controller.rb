class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end


  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_paramas)
  	if @book.save
  	    flash[:create] = "Book was successfully created."
  	    redirect_to book_path(@book.id)
  	else
  		@books = Book.all
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_paramas)
  		flash[:update] = "Book was successfully updated."
        redirect_to book_path(book.id)
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_paramas
  	params.require(:book).permit(:title, :body)
  end
end