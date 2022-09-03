class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @items = Item.all
    @total_price = 0
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
    else
    @cart_item.save
    end
    redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  public
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
