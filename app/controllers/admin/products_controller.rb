class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = 1
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product.update
    redirect_to admin_product_path
  end

  def show
    @product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:image_id, :name, :body, :genre_id, :tax_out_price, :status)
  end

end
