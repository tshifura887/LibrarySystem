class AuthorsBooksController < ApplicationController
  def search
  end
  
    def results
      @books = Book.all
      book_ids = Book.where(["LOWER(title) LIKE ?", "%#{params[:search]}"]).ids
      @books = Book.where(id: book_ids)

      author_ids = Author.where(["LOWER(name) LIKE ?", "%#{params[:search]}"]).ids
      book_authors_ids = AuthorsBook.where(author_id: author_ids).pluck(:book_id)
      @book_authors = Book.where(id: book_authors_ids)
    end
end
