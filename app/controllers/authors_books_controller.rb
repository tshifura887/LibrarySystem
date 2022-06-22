class AuthorsBooksController < ApplicationController
  def search
  end
  
    def results
      @books = Book.all
      book_ids = Book.where(title: params[:search]).ids
      author_ids = Author.where(name: params[:search]).ids
      book_author_ids = AuthorsBook.where(author_id: author_ids).pluck(:book_id)
      @books = Book.where(id: book_ids) || Book.where(id: book_author_ids)
    end
end
