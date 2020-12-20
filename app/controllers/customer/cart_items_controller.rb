class Customer::CartItemsController < ApplicationController
  
  def index
    @products = Product.all
  end 
  
  def destroy
    
  end 
  
  def destroy_all
    CartItems.destroy_all
    redirect_to cart_items_path（）
end
  
end
