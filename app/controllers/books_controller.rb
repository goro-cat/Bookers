class BooksController < ApplicationController
  def index
    @books = Book.all
    @book_new = Book.new
  end

  def create
    @books = Book.all
    @book_new = Book.new(book_params)
    #book.save
    ##redirect_to book_path(book.id)

    if @book_new.save
      flash[:success]= 'Book was successfully created.'
      redirect_to book_path(@book_new.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    #book.update(book_params)
    #redirect_to book_path

    if @book.update(book_params)
      flash[:success]='Book was successfully updated.'
      redirect_to book_path
    else

      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success]= 'Book was successfuly destroyed.'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
