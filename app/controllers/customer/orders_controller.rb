class Customer::OrdersController < ApplicationController

  def thanks
  end

  def index
    @orders = Order.all

  end

  def show
  end

  def new
    @order = Order.find(params[:id])
  end

  def create
  end

  def confirm
    @order = Order.find(params[:id])
  end

  private
  def orders_params
    params.require(:order).permit(:user_id, :postal_code, :address, :name, :shipping, :payment, :sum)
  end

end
