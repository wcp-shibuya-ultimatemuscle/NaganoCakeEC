class Customer::ProductsController < ApplicationController

  def index
    @genres = Genre.where(is_active: "有効")
    if params[:id]
      @products = Product.where(genre_id: params[:id])
    else
      @products = Product.where(genre_id: (Genre.where(is_active: "有効")))
    end
  end




  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    @cart.product_id = @product.id
    #@cart.quantity = params[:quantity]
    if @cart.save
      #redirect_to cart_items_path(customer_id: current_customer.id)
    end
  end

  private

  def product_params
    params.require(@product).permit(:name, :tax_out_price)
  end

  def cart_params
    params.permit(:product_id, :customer_id, :quantity)
  end




end
