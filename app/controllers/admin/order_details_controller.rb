class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_id]) #paramsがorder_idのorderを取得
    @order_detail = @order.order_details.find(params[:id]) #@order.detailsで全てのorder_detailをまず取得し、その中から更新したいorder_detailを一つ取り出す
    @order_detail.update(order_detail_params) #order_detailを一つだけ更新
    redirect_to admin_order_path(@order.id)
  end

  #ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :making_status)
  end

end
