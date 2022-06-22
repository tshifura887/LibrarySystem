class AuthorsController < ApplicationController
    def create
        @book =  Book.find(params[:book_id])
        @author = @book.authors.create!(author_params)
        redirect_to book_path(@book)
      end
    
      def destroy
        @book = book.find(params[:book_authors])
        @author = @book.athors.find(params[:id])
        @author.destroy
        redirect_to book_path(@book)
      end
    
      private
        def author_params
          params.require(:author).permit(:name)
        end
end
