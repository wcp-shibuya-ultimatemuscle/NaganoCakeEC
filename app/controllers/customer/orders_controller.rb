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
    @receiver = current_customer
  end

  def create
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    @order.save
    @carts = Cart.where(customer_id: current_customer.id)
    @order_product = OrderProduct.new(order_product_params)
    @order_product.order_id = @order.id
    @order_product.save
    #cart.destroy_all
    redirect_to orders_thanks_path
  end

  def confirm
    @kaime = 0
    @carts = Cart.where(customer_id: current_customer.id)
    @subtotal = 0
    @total = 0
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    # ご自身の住所なら
    if params[:select_name] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.family_name + current_customer.first_name
      # 登録済み住所から選択なら
    elsif params[:select_name] == "1"
      @receiver = Receiver.find(params[:order][:receiver_id])
      @order.address = @receiver.address
      @order.postal_code = @receiver.postal_code
      @order.name = @receiver.name
      # 新しいお届け先なら
    elsif params[:select_name] == "2"
      @receiver = Receiver.new(receiver_params)
      @receiver.customer_id = current_customer.id
      @receiver.save
      @order.address = @receiver.address
      @order.postal_code = @receiver.postal_code
      @order.name = @receiver.name
    end
  end

  private
  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping, :payment, :sum)
  end

  def receiver_params
    params.require(:receiver).permit(:postal_code, :address, :name)
  end

  def cart_params
    params.permit(:product_id, :customer_id, :quantity)
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :order_id, :quantity, :tax_in_price, :status)
  end

end
