class Customer::OrdersController < ApplicationController

  def thanks
  end

  def index

  end

  def show
  end

  def new
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
