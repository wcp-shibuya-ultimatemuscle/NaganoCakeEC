class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(1)   #のちに @customer = Customer.find(current_customer.id) になります
  end

  def edit
  end
end
