class Admin::OrdersController < ApplicationController

  def top
    @todayorder = Order.where(created_at: Time.now.all_day) #本日作成したOrderを代入
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.update(orders_params)
    redirect_to request.referer
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
    @a = 0
    @b = 0
  end

  private

  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :status, :address, :name, :shipping, :payment, :sum)
  end

end
