class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.page(params[:page])
    @order_details = OrderDetail.all
  end
  
  def show
  end

  def update
  end
end
