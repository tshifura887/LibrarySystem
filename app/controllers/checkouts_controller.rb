class CheckoutsController < ApplicationController
    def create
        checkout = Checkout.new(patron_id: params[:patron_id], book_id: params[:book_id], issue_date: DateTime.now.utc, return_date: Time.now)
        if checkout.save  
            redirect_to checkouts_path
        else   
            render :new
        end
    end

    def index 
        @checkouts = Checkout.where(patron_id: current_user.id)  
    end

    
end
