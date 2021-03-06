class Customer::ReceiversController < ApplicationController
  before_action :authenticate_customer!

  def index
    @receiver = Receiver.new
    @receivers = Receiver.where(customer_id: current_customer.id)

  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.customer_id = current_customer.id
    if @receiver.save
      redirect_to receivers_path
    else
      @receivers = Receiver.where(customer_id: current_customer.id)
      render :index
    end
  end

  def edit
    @receiver = Receiver.find(params[:id])
    unless @receiver.customer_id == current_customer.id    #URL直打ち対策、ログインしている会員以外は編集一覧にとばされます
      redirect_to receivers_path
    end
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to receivers_path
    else
      render :edit
    end
  end

  def destroy
    receiver = Receiver.find(params[:id])
    receiver.destroy
    redirect_to receivers_path
  end

  private

  def receiver_params
    params.require(:receiver).permit(:postal_code, :address, :name)
  end
end
