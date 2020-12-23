class Admin::OrdersController < ApplicationController

  def top
    @todayorder = Order.where(created_at: Time.now.all_day) #本日作成したOrderを代入
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    order_products = OrderProduct.where(order_id: @order.id)
    @order.status = params[:status]
    @order.update(orders_params)
     if @order.status == "入金確認"
       order_products.each do |order_product|
         order_product.status = "製作待ち"
         order_product.update(order_creates_params)
       end
     end
    redirect_to request.referer
  end



  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
  end

  private

  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :status, :address, :name, :shipping, :payment, :sum)
  end

  def order_creates_params
    params.permit(:product_id, :order_id, :quantity, :tax_in_price, :status)
  end

end
