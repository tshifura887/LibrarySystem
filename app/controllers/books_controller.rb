class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    if current_user.try(:role) == 'User::Patron'
      @books = Book.where.not(id: current_user.checkouts.pluck(:book_id)) 
    else   
      @books = Book.all
    end
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

  def overdue_books
    @checkouts = Checkout.where(returned: false).where('return_date < ?', Time.now)
  end

  private
    
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :language, :published, :summary, :name)
    end
end
