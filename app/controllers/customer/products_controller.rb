class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
    #@genre_products = Genre.where(genre_id: params[:genre_id])
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(@product).permit(:name, :tax_out_price)
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @genre = Genre.search(params[:search])
  end


end
