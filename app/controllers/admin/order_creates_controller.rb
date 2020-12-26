class Admin::OrderCreatesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = Order.find(@order_product.order.id)
    @order_product.status = params[:status]
    @order_product.update(order_creates_params)
    if @order_product.status == "製作中" #注文商品のステータスが「製作中」になると紐付く注文のステータスを「製作中」にする
      @order.status = "製作中"
      @order.update(orders_params)
    end
    if OrderProduct.where(order_id: @order_product.order_id).pluck(:status).uniq.join == "製作完了"
      #同じ注文に基づいた注文商品のステータスを全て呼び出し、配列内で重複した内部要素を1個にまとめ、その結果が「製作完了」と等しければ
      @order.status = "発送準備中"
      @order.update(orders_params)
    end

    redirect_to request.referer
  end

  private

  def orders_params
    params.permit(:customer_id, :postal_code, :status, :address, :name, :shipping, :payment, :sum)
  end

  def order_creates_params
    params.require(:order_product).permit(:product_id, :order_id, :quantity, :tax_in_price, :status)
  end

end
