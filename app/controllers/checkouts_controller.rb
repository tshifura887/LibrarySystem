class CheckoutsController < ApplicationController
    def create
        checkout = Checkout.new(patron_id: params[:patron_id], book_id: params[:book_id], issue_date: DateTime.now.utc, return_date: Time.now + 10.days)
        if checkout.save  
            redirect_to checkouts_path
        else   
            render :new
        end
    end

    def index  
        # if current_user.patron?
        #     @checkouts = Checkout.where(patron_id: current_user.id)
        #     @books = Book.where.not(id: current_user.checkouts.pluck(:book_id))
        # elsif  current_user.librarian? 
        #     @checkouts = Checkout.all
        # end
        @checkouts = Checkout.where(patron_id: current_user.id)
        @books = Book.where.not(id: current_user.checkouts.pluck(:book_id))
            
    end

    def returns
        
    end
end
