class Admin::CustomersController < ApplicationController

  def index
    @customers=Customer.page(params[:page]).per(2)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :tel, :is_deleted)
  end

end
