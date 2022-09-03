class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def comfirm
    @cart_items = CartItem.all
    @shopping_cost = 800
    @total_price = 0
    @order = Order.new(order_params)
    # @address = Address.find(params[:order][:address_id])
    if params[:order][:address_number] == "0"
      @order.address = current_customer.address  
    elsif params[:order][:address_number] =="1"
      @order.address = @address
    else
    end

  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :shopping_cost, :total_payment)
  end
end
