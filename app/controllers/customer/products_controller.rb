class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where(genre_id: params[:id])
  end

  private

  def product_params
    params.require(@product).permit(:name, :tax_out_price)
  end


end
