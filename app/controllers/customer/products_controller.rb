class Customer::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @genres = Genre.where(is_active: "有効")

    if params[:id]
      @product = Product.where(genre_id: params[:id])
      @products = Product.where(genre_id: params[:id]).page(params[:page])
      @genre = Genre.find(params[:id])
    else
      @product = Product.where(genre_id: (Genre.where(is_active: "有効")))
      @products = Product.where(genre_id: (Genre.where(is_active: "有効"))).page(params[:page])
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
