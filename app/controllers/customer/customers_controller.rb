class Customer::CustomersController < ApplicationController
before_action :authenticate_customer!
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
    customer.is_deleted = true                         #退会するボタンを押したとき現在ログインしているユーザーのis_deleteカラムをtrueに変えます。
    customer.update(customer_is_deleted)               #下で作成しているcustomer_is_deletedメソッドを呼び出しています
    reset_session                                       #セッションリセットによるログアウト処理
    redirect_to root_path                              #今はトップページに戻ってもログインしたままですが、ホクトさんにログイン状態の権限を設定してもらう予定です。
  end


  private
  def customer_params
     params.require(:customer).permit(:email, :family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :tel, :is_deleted)
  end

  def customer_is_deleted
     params.permit(:is_deleted)                  #require(:customer)を入れるとエラーが起きます。
  end
end
