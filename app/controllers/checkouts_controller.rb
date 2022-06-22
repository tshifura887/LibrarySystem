class CheckoutsController < ApplicationController
    def index  
        @checkouts = Checkout.all
        @book_dict = {}
        @books = Book.all    

        @patron_dict = {}
        @patrons = Patron.all

        @books.each do |book|
            @book_dict[book.id] = book.title
        end

        @patrons.each do |patron|
            @patron_dict[patron.id] = patron.email
        end

        @checkouts.each do |checkout|
            @book = Book.find(checkout[:book_id])
        end
    end

    def show 
        @book =  Book.find(params[:id])
    end

    def returns 
        @checkout = Checkout.find(params[:id])
        @book = Book.find(@checkout[:book_id])
        @patron = Patron.find(@checkout[:patron_id])
    end
end
