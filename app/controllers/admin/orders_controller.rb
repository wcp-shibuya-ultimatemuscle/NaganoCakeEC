class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def top
    @todayorder = Order.where(created_at: Time.current.all_day) #本日作成したOrderを代入
  end

  def index
    case params[:order_type]
    when "today"
      @orders = Order.where(created_at: Time.current.all_day)
    when "customer"
      @customer = Customer.find(params[:format])
      @orders = @customer.orders
    else
      @orders = Order.all.page(params[:page]).per(10).order(id: "DESC")    #注文履歴を降順(新しいものが一番上に)ページャ設定
    end
  end

  def update
    @order = Order.find(params[:id])
    order_products = OrderProduct.where(order_id: @order.id)
    @order.status = params[:status]
    @order.update(orders_params)
     if @order.status == "入金確認" #注文のステータスが「入金確認」になると紐付く注文商品ステータスを「制作待ち」にする
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
