class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def comfirm
    @cart_items = CartItem.all
    @shopping_cost = 800
    @total_price = 0
    if params[:order][:address_number] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_number] =="1"
      @address = Address.find(params[:order][:address_id])
      @order = Order.new(order_params)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.add_tax_price
      @order_details.amount = cart_item.amount
      @order_details.save
      end
    redirect_to thanks_path
    current_customer.cart_items.destroy_all      
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all 
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders.all 
    @shopping_cost = 800
    @total_price = 0
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :shopping_cost, :total_payment)
  end
end
