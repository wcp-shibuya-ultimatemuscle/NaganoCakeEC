# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  before_action :authenticate_customer!
  before_action :reject_customer, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #def after_sign_in_path_for(resource)
  #  root_path
  #end

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)) # active_for_authentication?アクションにより self.is_deleted == "有効"の際実行される
        flash[:danger] = "退会済です。"
        redirect_to new_customer_session_path
      end
    else
      flash[:danger] = "必須項目を入力してください。"
    end
  end
end
