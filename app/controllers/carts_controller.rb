class CartsController < ApplicationController
    def create   
        cart = Cart.new(user_id: params[:patron_id])

        if cart.save  
            redirect_to cart_path(cart)
        else   
            render :new
        end
    end
end