class Admin::OrdersController < ApplicationController

  def top
    @todayorder = Order.where(created_at: Time.now.all_day) #本日作成したOrderを代入
  end

  def index
    @orders = Order.all
  end



  def show
    #@customer = Customer.find(params[:id])
    #@order = Order.find(params[:id])
    @order_products = OrderProduct.all
  end

end
