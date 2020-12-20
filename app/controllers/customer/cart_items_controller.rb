class Customer::CartItemsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
end
