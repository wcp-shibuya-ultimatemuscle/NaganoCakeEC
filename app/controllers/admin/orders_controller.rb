class Admin::OrdersController < ApplicationController

  def top
    @todayorder = Order.where(created_at: Time.now.all_day) #本日作成したOrderを代入
  end
  
  def index
    @orders = Order.all
  end 

end
