class Customer::OrdersController < ApplicationController

  def thanks
  end

  def index
    @orders = Order.all

  end

  def show
  end

  def new
    @order = Order.new(orders_params)
    @customer = current_customer
    @order.save
  end

  def create
  end

  def confirm
    @order = Order.find(params[:id])
  end

  private
  def orders_params
    params.permit(:customer_id, :postal_code, :address, :name, :shipping, :payment, :sum)
  end

end
