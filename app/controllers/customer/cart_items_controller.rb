class Customer::CartItemsController < ApplicationController


  def index
    @carts = Cart.all
  end

  def destroy

  end

  def destroy_all
    CartItems.destroy_all
    redirect_to cart_items_path（）
  end


end
