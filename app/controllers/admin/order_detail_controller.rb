class Admin::OrderDetailController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    
    # 1つでもorder_detailsのmaking_statusが製作中（２）ならorderのstatusを製作中（２）にする
    if @order_details.where(making_status: 2).count >= 1
        @order.update(status: 2)
    end
    
    # # order_detailのmaking_statusを全て製作完了(3)にしたらorderのstatusを発送準備中（3）にする
    if @order_detail.update(order_detail_params)
      @order.update(status: 3) if @order_details.count == @order_details.where(making_status: 3).count
    end
    redirect_to admin_order_path(@order_detail.order)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :making_status)
  end
end
