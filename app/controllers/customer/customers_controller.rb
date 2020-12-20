class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def unsubscribe
  end

  def withdraw
    customer = Customer.find(current_customer.id)
    customer.is_deleted = true
    customer.update(customer_is_deleted)
    redirect_to root_path
  end


  private
  def customer_params
     params.require(:customer).permit(:email, :family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :tel, :is_deleted)
  end

  def customer_is_deleted
     params.permit(:is_deleted)
  end
end
