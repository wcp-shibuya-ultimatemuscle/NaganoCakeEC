class Admin::OrderCreatesController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.status = params[:status]
    @order_product.update(order_creates_params)
    redirect_to request.referer
  end

  private

  def order_creates_params
    params.require(:order_product).permit(:product_id, :order_id, :quantity, :tax_in_price, :status)
  end

end
