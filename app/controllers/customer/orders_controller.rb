class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def thanks
  end

  def index
    @order = Order.where(customer_id: current_customer.id).page(params[:page]).per(5).order(id: "DESC")  #降順に設定
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
  end

  def new
    if Cart.find_by(customer_id: current_customer.id) == nil  #カート内商品が空ならカート画面に遷移
      redirect_to cart_items_path
    end
      @order = Order.new
      @customer = current_customer
      @receiver = current_customer
  end

  def create
    if Cart.where(customer_id: current_customer.id).count != 0  #カート内に商品があるかチェック、空ならトップページへ
      @order = Order.new(orders_params)
      @order.customer_id = current_customer.id
      if @order.save
        receiver = Receiver.new(receivers_params)  #新しい配送先を登録
        receiver.customer_id = current_customer.id
        receiver.postal_code = @order.postal_code
        receiver.address = @order.address
        receiver.name = @order.name
        receiver.save
        carts = Cart.where(customer_id: current_customer.id)
        carts.each do |cart|　#注文商品をorder_productモデルへ保存させる繰り返し処理
          order_product = OrderProduct.new(order_product_params)
          order_product.product_id = cart.product_id
          order_product.order_id = @order.id
          order_product.quantity = cart.quantity
          order_product.tax_in_price = cart.product.tax_out_price.to_i * 1.1
          order_product.save
        end
        carts.destroy_all
        redirect_to orders_thanks_path
      else
        @customer = current_customer
        @receiver = current_customer
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def confirm
    @carts = Cart.where(customer_id: current_customer.id)
    @subtotal = 0
    @total = 0
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    # ご自身の住所なら
    if params[:order][:select_name] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.family_name + current_customer.first_name
      # 登録済み住所から選択なら
    elsif params[:order][:select_name] == "1"
      if params[:order][:receiver_id].blank?
        @customer = current_customer
        render :new
      else
        @receiver = Receiver.find(params[:order][:receiver_id])
        @order.address = @receiver.address
        @order.postal_code = @receiver.postal_code
        @order.name = @receiver.name
      end
      # 新しいお届け先なら
    elsif params[:order][:select_name] == "2"
      if params[:order][:postal_code].blank? || params[:order][:address].blank? || params[:order][:name].blank?
        @order = Order.new(orders_params)
        @customer = current_customer
        flash[:error] = "空欄があります"
        render :new
      else
        @order = Order.new(orders_params)
        @order.customer_id = current_customer.id
        @order.save
      end
    end
  end

  private
  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping, :payment, :sum)
  end

  def receiver_params
    params.require(:receiver).permit(:postal_code, :address, :name)
  end

  def order_product_params
    params.permit(:product_id, :order_id, :quantity, :tax_in_price, :status)
  end

  def receivers_params
    params.permit(:postal_code, :address, :name)
  end



end
