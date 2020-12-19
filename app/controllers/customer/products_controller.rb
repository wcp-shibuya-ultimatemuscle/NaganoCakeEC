class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    #@product.save
    #redirect_to cart_items_path
  end

  private

  def product_params
    params.require(@product).permit(:name, :tax_out_price)
  end

end
