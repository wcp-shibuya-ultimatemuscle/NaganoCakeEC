class Customer::ReceiversController < ApplicationController

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
  end

  def update
    receiver = Receiver.find(params[:id])
    receiver.update(receiver_params)
    redirect_to receivers_path
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
