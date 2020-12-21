class Customer::OrdersController < ApplicationController

  def thanks
  end

  def index
    @orders = Order.all

  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
        #@order.save

  end

  def confirm
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
  end

  private
  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping, :payment, :sum)
  end

end
