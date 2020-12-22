class Customer::CartItemsController < ApplicationController


  def index
    @carts = Cart.where(customer_id: current_customer.id)
    @subtotal = 0
    @total = 0
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    customercart = Cart.where(customer_id: current_customer.id)
    alreadycart = customercart.find_by(product_id: params[:id])
    if alreadycart
      alreadycart.quantity += params[:quantity].to_i
      alreadycart.save
    else
      @cart.product_id = params[:id]
      @cart.save
    end
    redirect_to cart_items_path(current_customer.id)
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.quantity = params[:quantity]
    @cart.update(quantity_params)
    redirect_to request.referer
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart = Cart.where(customer_id: params[:id])
    @cart.destroy_all
    redirect_to request.referer
  end

  private

  def cart_params
    params.permit(:product_id, :customer_id, :quantity)
  end

  def quantity_params
    params.permit(:quantity)
  end


end
