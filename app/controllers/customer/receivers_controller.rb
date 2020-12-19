class Customer::ReceiversController < ApplicationController

  def index
    @receiver = Receiver.new
    @receivers = Receiver.where(customer_id: current_customer.id)
  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.customer_id = current_customer.id
    @receiver.save
    redirect_to receivers_path
  end


  private

  def receiver_params
    params.require(:receiver).permit(:postal_code, :address, :name)
  end
end
