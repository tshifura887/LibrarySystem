class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_url(@book), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_url(@book), notice: "Book was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book was successfully destroyed."
  end

  def book_request
    book = Book.find(params[:id])
    checkout = Checkout.new(book_id: book.id, issue_date: Time.now.getutc)

    if checkout.save(validate: true)
      flash[:notice]  = "Book titled #{book.name} successfully checked out"
    else   
      flash[:notice] = "The book is not available in the library. It is already checked out"
    end

    redirect_to @books
  end

  def book_return
    return_row = Checkouts.find_by(book_id: params[:book_id, return_date: nil])
    return_row.update(return_date: Time.now.getutc)
    book = Book.find(params[:book_id])
  end
  private
    
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :language, :published, :summary, :name)
    end
end
