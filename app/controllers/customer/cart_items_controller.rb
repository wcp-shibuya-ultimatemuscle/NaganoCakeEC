class Customer::CartItemsController < ApplicationController
<<<<<<< HEAD
  
  def index
    @products = Product.all
  end
  
=======

  def index

  end

  def destroy

  end

  def destroy_all
    CartItems.destroy_all
    redirect_to cart_items_path（）
  end

>>>>>>> 310e5a27c5677617052b351925e90b5831e4a5e8
end
