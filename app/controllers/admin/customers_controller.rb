class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers=Customer.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :tel, :is_deleted)
  end

end
