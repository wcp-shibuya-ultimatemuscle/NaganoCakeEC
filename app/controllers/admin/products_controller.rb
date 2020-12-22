class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(2)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  def show
    @product = Product.find(params[:id])
  end


  private

  def product_params
    params.require(:product).permit(:image, :name, :body, :genre_id, :tax_out_price, :status)
  end

end
