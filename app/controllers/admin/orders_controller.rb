class Admin::OrdersController < ApplicationController
  
  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page])
      @order_details = OrderDetail.all
      @total_amount = 0
    else
      @orders =Order.page(params[:page])
      @order_details = OrderDetail.all
      @total_amount = 0
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @shopping_cost = 800
    @total_price = 0

  end

  def update
    @order =Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :shopping_cost, :total_payment, :status)
  end
  

end
