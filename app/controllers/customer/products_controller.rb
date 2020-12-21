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
  end

  private

  def product_params
    params.require(@product).permit(:name, :tax_out_price)
  end


end
