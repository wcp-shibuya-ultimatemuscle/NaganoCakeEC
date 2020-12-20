class Customer::OrdersController < ApplicationController

  def thanks
  end

  def index
    @orders = Order.all

  end

  def show
  end

  def new
<<<<<<< HEAD
    @order = Order.new
    @orders = Order.all
=======
    @order = Order.find(params[:id])
>>>>>>> 310e5a27c5677617052b351925e90b5831e4a5e8
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
