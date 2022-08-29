class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @items = Item.all
    @total_price = 0
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
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
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :add, :sub_total)
  end
end
